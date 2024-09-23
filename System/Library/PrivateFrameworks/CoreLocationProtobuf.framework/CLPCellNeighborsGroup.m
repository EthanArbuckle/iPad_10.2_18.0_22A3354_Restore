@implementation CLPCellNeighborsGroup

- (void)clearGsmNeighbors
{
  -[NSMutableArray removeAllObjects](self->_gsmNeighbors, "removeAllObjects");
}

- (void)addGsmNeighbors:(id)a3
{
  id v4;
  NSMutableArray *gsmNeighbors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  gsmNeighbors = self->_gsmNeighbors;
  v8 = v4;
  if (!gsmNeighbors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_gsmNeighbors;
    self->_gsmNeighbors = v6;

    v4 = v8;
    gsmNeighbors = self->_gsmNeighbors;
  }
  -[NSMutableArray addObject:](gsmNeighbors, "addObject:", v4);

}

- (unint64_t)gsmNeighborsCount
{
  return -[NSMutableArray count](self->_gsmNeighbors, "count");
}

- (id)gsmNeighborsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_gsmNeighbors, "objectAtIndex:", a3);
}

+ (Class)gsmNeighborsType
{
  return (Class)objc_opt_class();
}

- (void)clearScdmaNeighbors
{
  -[NSMutableArray removeAllObjects](self->_scdmaNeighbors, "removeAllObjects");
}

- (void)addScdmaNeighbors:(id)a3
{
  id v4;
  NSMutableArray *scdmaNeighbors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  scdmaNeighbors = self->_scdmaNeighbors;
  v8 = v4;
  if (!scdmaNeighbors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_scdmaNeighbors;
    self->_scdmaNeighbors = v6;

    v4 = v8;
    scdmaNeighbors = self->_scdmaNeighbors;
  }
  -[NSMutableArray addObject:](scdmaNeighbors, "addObject:", v4);

}

- (unint64_t)scdmaNeighborsCount
{
  return -[NSMutableArray count](self->_scdmaNeighbors, "count");
}

- (id)scdmaNeighborsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_scdmaNeighbors, "objectAtIndex:", a3);
}

+ (Class)scdmaNeighborsType
{
  return (Class)objc_opt_class();
}

- (void)clearCdmaNeighbors
{
  -[NSMutableArray removeAllObjects](self->_cdmaNeighbors, "removeAllObjects");
}

- (void)addCdmaNeighbors:(id)a3
{
  id v4;
  NSMutableArray *cdmaNeighbors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  cdmaNeighbors = self->_cdmaNeighbors;
  v8 = v4;
  if (!cdmaNeighbors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_cdmaNeighbors;
    self->_cdmaNeighbors = v6;

    v4 = v8;
    cdmaNeighbors = self->_cdmaNeighbors;
  }
  -[NSMutableArray addObject:](cdmaNeighbors, "addObject:", v4);

}

- (unint64_t)cdmaNeighborsCount
{
  return -[NSMutableArray count](self->_cdmaNeighbors, "count");
}

- (id)cdmaNeighborsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_cdmaNeighbors, "objectAtIndex:", a3);
}

+ (Class)cdmaNeighborsType
{
  return (Class)objc_opt_class();
}

- (void)clearLteNeighbors
{
  -[NSMutableArray removeAllObjects](self->_lteNeighbors, "removeAllObjects");
}

- (void)addLteNeighbors:(id)a3
{
  id v4;
  NSMutableArray *lteNeighbors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  lteNeighbors = self->_lteNeighbors;
  v8 = v4;
  if (!lteNeighbors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_lteNeighbors;
    self->_lteNeighbors = v6;

    v4 = v8;
    lteNeighbors = self->_lteNeighbors;
  }
  -[NSMutableArray addObject:](lteNeighbors, "addObject:", v4);

}

- (unint64_t)lteNeighborsCount
{
  return -[NSMutableArray count](self->_lteNeighbors, "count");
}

- (id)lteNeighborsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_lteNeighbors, "objectAtIndex:", a3);
}

+ (Class)lteNeighborsType
{
  return (Class)objc_opt_class();
}

- (void)clearNrNeighbors
{
  -[NSMutableArray removeAllObjects](self->_nrNeighbors, "removeAllObjects");
}

- (void)addNrNeighbors:(id)a3
{
  id v4;
  NSMutableArray *nrNeighbors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  nrNeighbors = self->_nrNeighbors;
  v8 = v4;
  if (!nrNeighbors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_nrNeighbors;
    self->_nrNeighbors = v6;

    v4 = v8;
    nrNeighbors = self->_nrNeighbors;
  }
  -[NSMutableArray addObject:](nrNeighbors, "addObject:", v4);

}

- (unint64_t)nrNeighborsCount
{
  return -[NSMutableArray count](self->_nrNeighbors, "count");
}

- (id)nrNeighborsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_nrNeighbors, "objectAtIndex:", a3);
}

+ (Class)nrNeighborsType
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
  v8.super_class = (Class)CLPCellNeighborsGroup;
  -[CLPCellNeighborsGroup description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPCellNeighborsGroup dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
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
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_gsmNeighbors, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_gsmNeighbors, "count"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v5 = self->_gsmNeighbors;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v57;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v57 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("gsmNeighbors"));
  }
  if (-[NSMutableArray count](self->_scdmaNeighbors, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_scdmaNeighbors, "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v12 = self->_scdmaNeighbors;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v53;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v53 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v16), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("scdmaNeighbors"));
  }
  if (-[NSMutableArray count](self->_cdmaNeighbors, "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_cdmaNeighbors, "count"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v19 = self->_cdmaNeighbors;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v49;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v49 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v23), "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
      }
      while (v21);
    }

    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("cdmaNeighbors"));
  }
  if (-[NSMutableArray count](self->_lteNeighbors, "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_lteNeighbors, "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v26 = self->_lteNeighbors;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v45;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v45 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v30), "dictionaryRepresentation");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
      }
      while (v28);
    }

    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("lteNeighbors"));
  }
  if (-[NSMutableArray count](self->_nrNeighbors, "count"))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_nrNeighbors, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v33 = self->_nrNeighbors;
    v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v41;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v41 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v37), "dictionaryRepresentation", (_QWORD)v40);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v38);

          ++v37;
        }
        while (v35 != v37);
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
      }
      while (v35);
    }

    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("nrNeighbors"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPCellNeighborsGroupReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = self->_gsmNeighbors;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = self->_scdmaNeighbors;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v12);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = self->_cdmaNeighbors;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v17);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = self->_lteNeighbors;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    }
    while (v22);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = self->_nrNeighbors;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
    }
    while (v27);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  id v24;

  v24 = a3;
  if (-[CLPCellNeighborsGroup gsmNeighborsCount](self, "gsmNeighborsCount"))
  {
    objc_msgSend(v24, "clearGsmNeighbors");
    v4 = -[CLPCellNeighborsGroup gsmNeighborsCount](self, "gsmNeighborsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[CLPCellNeighborsGroup gsmNeighborsAtIndex:](self, "gsmNeighborsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addGsmNeighbors:", v7);

      }
    }
  }
  if (-[CLPCellNeighborsGroup scdmaNeighborsCount](self, "scdmaNeighborsCount"))
  {
    objc_msgSend(v24, "clearScdmaNeighbors");
    v8 = -[CLPCellNeighborsGroup scdmaNeighborsCount](self, "scdmaNeighborsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[CLPCellNeighborsGroup scdmaNeighborsAtIndex:](self, "scdmaNeighborsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addScdmaNeighbors:", v11);

      }
    }
  }
  if (-[CLPCellNeighborsGroup cdmaNeighborsCount](self, "cdmaNeighborsCount"))
  {
    objc_msgSend(v24, "clearCdmaNeighbors");
    v12 = -[CLPCellNeighborsGroup cdmaNeighborsCount](self, "cdmaNeighborsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[CLPCellNeighborsGroup cdmaNeighborsAtIndex:](self, "cdmaNeighborsAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addCdmaNeighbors:", v15);

      }
    }
  }
  if (-[CLPCellNeighborsGroup lteNeighborsCount](self, "lteNeighborsCount"))
  {
    objc_msgSend(v24, "clearLteNeighbors");
    v16 = -[CLPCellNeighborsGroup lteNeighborsCount](self, "lteNeighborsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[CLPCellNeighborsGroup lteNeighborsAtIndex:](self, "lteNeighborsAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addLteNeighbors:", v19);

      }
    }
  }
  if (-[CLPCellNeighborsGroup nrNeighborsCount](self, "nrNeighborsCount"))
  {
    objc_msgSend(v24, "clearNrNeighbors");
    v20 = -[CLPCellNeighborsGroup nrNeighborsCount](self, "nrNeighborsCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        -[CLPCellNeighborsGroup nrNeighborsAtIndex:](self, "nrNeighborsAtIndex:", n);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addNrNeighbors:", v23);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
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
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v6 = self->_gsmNeighbors;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v54;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v54 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addGsmNeighbors:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v8);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v12 = self->_scdmaNeighbors;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v50;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v50 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend(v5, "addScdmaNeighbors:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    }
    while (v14);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v18 = self->_cdmaNeighbors;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v46;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v46 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v22), "copyWithZone:", a3);
        objc_msgSend(v5, "addCdmaNeighbors:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
    }
    while (v20);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v24 = self->_lteNeighbors;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v42;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v42 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v28), "copyWithZone:", a3);
        objc_msgSend(v5, "addLteNeighbors:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v41, v58, 16);
    }
    while (v26);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v30 = self->_nrNeighbors;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v38;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v38 != v33)
          objc_enumerationMutation(v30);
        v35 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v34), "copyWithZone:", a3, (_QWORD)v37);
        objc_msgSend(v5, "addNrNeighbors:", v35);

        ++v34;
      }
      while (v32 != v34);
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
    }
    while (v32);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *gsmNeighbors;
  NSMutableArray *scdmaNeighbors;
  NSMutableArray *cdmaNeighbors;
  NSMutableArray *lteNeighbors;
  NSMutableArray *nrNeighbors;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((gsmNeighbors = self->_gsmNeighbors, !((unint64_t)gsmNeighbors | v4[2]))
     || -[NSMutableArray isEqual:](gsmNeighbors, "isEqual:"))
    && ((scdmaNeighbors = self->_scdmaNeighbors, !((unint64_t)scdmaNeighbors | v4[5]))
     || -[NSMutableArray isEqual:](scdmaNeighbors, "isEqual:"))
    && ((cdmaNeighbors = self->_cdmaNeighbors, !((unint64_t)cdmaNeighbors | v4[1]))
     || -[NSMutableArray isEqual:](cdmaNeighbors, "isEqual:"))
    && ((lteNeighbors = self->_lteNeighbors, !((unint64_t)lteNeighbors | v4[3]))
     || -[NSMutableArray isEqual:](lteNeighbors, "isEqual:")))
  {
    nrNeighbors = self->_nrNeighbors;
    if ((unint64_t)nrNeighbors | v4[4])
      v10 = -[NSMutableArray isEqual:](nrNeighbors, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSMutableArray hash](self->_gsmNeighbors, "hash");
  v4 = -[NSMutableArray hash](self->_scdmaNeighbors, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_cdmaNeighbors, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_lteNeighbors, "hash");
  return v6 ^ -[NSMutableArray hash](self->_nrNeighbors, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = v4[2];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        -[CLPCellNeighborsGroup addGsmNeighbors:](self, "addGsmNeighbors:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = v4[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        -[CLPCellNeighborsGroup addScdmaNeighbors:](self, "addScdmaNeighbors:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v12);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = v4[1];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        -[CLPCellNeighborsGroup addCdmaNeighbors:](self, "addCdmaNeighbors:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v17);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = v4[3];
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        -[CLPCellNeighborsGroup addLteNeighbors:](self, "addLteNeighbors:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v24++));
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    }
    while (v22);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = v4[4];
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        -[CLPCellNeighborsGroup addNrNeighbors:](self, "addNrNeighbors:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v29++), (_QWORD)v30);
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
    }
    while (v27);
  }

}

- (NSMutableArray)gsmNeighbors
{
  return self->_gsmNeighbors;
}

- (void)setGsmNeighbors:(id)a3
{
  objc_storeStrong((id *)&self->_gsmNeighbors, a3);
}

- (NSMutableArray)scdmaNeighbors
{
  return self->_scdmaNeighbors;
}

- (void)setScdmaNeighbors:(id)a3
{
  objc_storeStrong((id *)&self->_scdmaNeighbors, a3);
}

- (NSMutableArray)cdmaNeighbors
{
  return self->_cdmaNeighbors;
}

- (void)setCdmaNeighbors:(id)a3
{
  objc_storeStrong((id *)&self->_cdmaNeighbors, a3);
}

- (NSMutableArray)lteNeighbors
{
  return self->_lteNeighbors;
}

- (void)setLteNeighbors:(id)a3
{
  objc_storeStrong((id *)&self->_lteNeighbors, a3);
}

- (NSMutableArray)nrNeighbors
{
  return self->_nrNeighbors;
}

- (void)setNrNeighbors:(id)a3
{
  objc_storeStrong((id *)&self->_nrNeighbors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scdmaNeighbors, 0);
  objc_storeStrong((id *)&self->_nrNeighbors, 0);
  objc_storeStrong((id *)&self->_lteNeighbors, 0);
  objc_storeStrong((id *)&self->_gsmNeighbors, 0);
  objc_storeStrong((id *)&self->_cdmaNeighbors, 0);
}

@end
