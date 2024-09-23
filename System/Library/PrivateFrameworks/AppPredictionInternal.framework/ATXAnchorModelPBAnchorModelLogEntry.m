@implementation ATXAnchorModelPBAnchorModelLogEntry

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (BOOL)hasAnchor
{
  return self->_anchor != 0;
}

- (void)clearPositiveAppLaunches
{
  -[NSMutableArray removeAllObjects](self->_positiveAppLaunches, "removeAllObjects");
}

- (void)addPositiveAppLaunches:(id)a3
{
  id v4;
  NSMutableArray *positiveAppLaunches;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  positiveAppLaunches = self->_positiveAppLaunches;
  v8 = v4;
  if (!positiveAppLaunches)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_positiveAppLaunches;
    self->_positiveAppLaunches = v6;

    v4 = v8;
    positiveAppLaunches = self->_positiveAppLaunches;
  }
  -[NSMutableArray addObject:](positiveAppLaunches, "addObject:", v4);

}

- (unint64_t)positiveAppLaunchesCount
{
  return -[NSMutableArray count](self->_positiveAppLaunches, "count");
}

- (id)positiveAppLaunchesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_positiveAppLaunches, "objectAtIndex:", a3);
}

+ (Class)positiveAppLaunchesType
{
  return (Class)objc_opt_class();
}

- (void)clearPositiveActions
{
  -[NSMutableArray removeAllObjects](self->_positiveActions, "removeAllObjects");
}

- (void)addPositiveActions:(id)a3
{
  id v4;
  NSMutableArray *positiveActions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  positiveActions = self->_positiveActions;
  v8 = v4;
  if (!positiveActions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_positiveActions;
    self->_positiveActions = v6;

    v4 = v8;
    positiveActions = self->_positiveActions;
  }
  -[NSMutableArray addObject:](positiveActions, "addObject:", v4);

}

- (unint64_t)positiveActionsCount
{
  return -[NSMutableArray count](self->_positiveActions, "count");
}

- (id)positiveActionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_positiveActions, "objectAtIndex:", a3);
}

+ (Class)positiveActionsType
{
  return (Class)objc_opt_class();
}

- (void)clearNegativeAppLaunches
{
  -[NSMutableArray removeAllObjects](self->_negativeAppLaunches, "removeAllObjects");
}

- (void)addNegativeAppLaunches:(id)a3
{
  id v4;
  NSMutableArray *negativeAppLaunches;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  negativeAppLaunches = self->_negativeAppLaunches;
  v8 = v4;
  if (!negativeAppLaunches)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_negativeAppLaunches;
    self->_negativeAppLaunches = v6;

    v4 = v8;
    negativeAppLaunches = self->_negativeAppLaunches;
  }
  -[NSMutableArray addObject:](negativeAppLaunches, "addObject:", v4);

}

- (unint64_t)negativeAppLaunchesCount
{
  return -[NSMutableArray count](self->_negativeAppLaunches, "count");
}

- (id)negativeAppLaunchesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_negativeAppLaunches, "objectAtIndex:", a3);
}

+ (Class)negativeAppLaunchesType
{
  return (Class)objc_opt_class();
}

- (void)clearNegativeActions
{
  -[NSMutableArray removeAllObjects](self->_negativeActions, "removeAllObjects");
}

- (void)addNegativeActions:(id)a3
{
  id v4;
  NSMutableArray *negativeActions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  negativeActions = self->_negativeActions;
  v8 = v4;
  if (!negativeActions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_negativeActions;
    self->_negativeActions = v6;

    v4 = v8;
    negativeActions = self->_negativeActions;
  }
  -[NSMutableArray addObject:](negativeActions, "addObject:", v4);

}

- (unint64_t)negativeActionsCount
{
  return -[NSMutableArray count](self->_negativeActions, "count");
}

- (id)negativeActionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_negativeActions, "objectAtIndex:", a3);
}

+ (Class)negativeActionsType
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
  v8.super_class = (Class)ATXAnchorModelPBAnchorModelLogEntry;
  -[ATXAnchorModelPBAnchorModelLogEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelPBAnchorModelLogEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *userId;
  ATXAnchorModelPBAnchorMetadata *anchor;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
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
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  userId = self->_userId;
  if (userId)
    objc_msgSend(v3, "setObject:forKey:", userId, CFSTR("userId"));
  anchor = self->_anchor;
  if (anchor)
  {
    -[ATXAnchorModelPBAnchorMetadata dictionaryRepresentation](anchor, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("anchor"));

  }
  if (-[NSMutableArray count](self->_positiveAppLaunches, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_positiveAppLaunches, "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v9 = self->_positiveAppLaunches;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v50 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("positiveAppLaunches"));
  }
  if (-[NSMutableArray count](self->_positiveActions, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_positiveActions, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v16 = self->_positiveActions;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v46 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("positiveActions"));
  }
  if (-[NSMutableArray count](self->_negativeAppLaunches, "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_negativeAppLaunches, "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v23 = self->_negativeAppLaunches;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v42 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * k), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      }
      while (v25);
    }

    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("negativeAppLaunches"));
  }
  if (-[NSMutableArray count](self->_negativeActions, "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_negativeActions, "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v30 = self->_negativeActions;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v38;
      do
      {
        for (m = 0; m != v32; ++m)
        {
          if (*(_QWORD *)v38 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * m), "dictionaryRepresentation", (_QWORD)v37);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v35);

        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
      }
      while (v32);
    }

    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("negativeActions"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXAnchorModelPBAnchorModelLogEntryReadFrom((uint64_t)self, (uint64_t)a3);
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
  __int128 v25;
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
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_userId)
    PBDataWriterWriteStringField();
  if (self->_anchor)
    PBDataWriterWriteSubmessage();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self->_positiveAppLaunches;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_positiveActions;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_negativeAppLaunches;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self->_negativeActions;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
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
  id v20;

  v20 = a3;
  if (self->_userId)
    objc_msgSend(v20, "setUserId:");
  if (self->_anchor)
    objc_msgSend(v20, "setAnchor:");
  if (-[ATXAnchorModelPBAnchorModelLogEntry positiveAppLaunchesCount](self, "positiveAppLaunchesCount"))
  {
    objc_msgSend(v20, "clearPositiveAppLaunches");
    v4 = -[ATXAnchorModelPBAnchorModelLogEntry positiveAppLaunchesCount](self, "positiveAppLaunchesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ATXAnchorModelPBAnchorModelLogEntry positiveAppLaunchesAtIndex:](self, "positiveAppLaunchesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addPositiveAppLaunches:", v7);

      }
    }
  }
  if (-[ATXAnchorModelPBAnchorModelLogEntry positiveActionsCount](self, "positiveActionsCount"))
  {
    objc_msgSend(v20, "clearPositiveActions");
    v8 = -[ATXAnchorModelPBAnchorModelLogEntry positiveActionsCount](self, "positiveActionsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[ATXAnchorModelPBAnchorModelLogEntry positiveActionsAtIndex:](self, "positiveActionsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addPositiveActions:", v11);

      }
    }
  }
  if (-[ATXAnchorModelPBAnchorModelLogEntry negativeAppLaunchesCount](self, "negativeAppLaunchesCount"))
  {
    objc_msgSend(v20, "clearNegativeAppLaunches");
    v12 = -[ATXAnchorModelPBAnchorModelLogEntry negativeAppLaunchesCount](self, "negativeAppLaunchesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[ATXAnchorModelPBAnchorModelLogEntry negativeAppLaunchesAtIndex:](self, "negativeAppLaunchesAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addNegativeAppLaunches:", v15);

      }
    }
  }
  if (-[ATXAnchorModelPBAnchorModelLogEntry negativeActionsCount](self, "negativeActionsCount"))
  {
    objc_msgSend(v20, "clearNegativeActions");
    v16 = -[ATXAnchorModelPBAnchorModelLogEntry negativeActionsCount](self, "negativeActionsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[ATXAnchorModelPBAnchorModelLogEntry negativeActionsAtIndex:](self, "negativeActionsAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addNegativeActions:", v19);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
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
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_userId, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  v8 = -[ATXAnchorModelPBAnchorMetadata copyWithZone:](self->_anchor, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v10 = self->_positiveAppLaunches;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v48;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v14), "copyWithZone:", a3);
        objc_msgSend(v5, "addPositiveAppLaunches:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v12);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v16 = self->_positiveActions;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v44;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v44 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v20), "copyWithZone:", a3);
        objc_msgSend(v5, "addPositiveActions:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v18);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v22 = self->_negativeAppLaunches;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v40;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v40 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v26), "copyWithZone:", a3);
        objc_msgSend(v5, "addNegativeAppLaunches:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    }
    while (v24);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = self->_negativeActions;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v36;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v32), "copyWithZone:", a3, (_QWORD)v35);
        objc_msgSend(v5, "addNegativeActions:", v33);

        ++v32;
      }
      while (v30 != v32);
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    }
    while (v30);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *userId;
  ATXAnchorModelPBAnchorMetadata *anchor;
  NSMutableArray *positiveAppLaunches;
  NSMutableArray *positiveActions;
  NSMutableArray *negativeAppLaunches;
  NSMutableArray *negativeActions;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((userId = self->_userId, !((unint64_t)userId | v4[6]))
     || -[NSString isEqual:](userId, "isEqual:"))
    && ((anchor = self->_anchor, !((unint64_t)anchor | v4[1]))
     || -[ATXAnchorModelPBAnchorMetadata isEqual:](anchor, "isEqual:"))
    && ((positiveAppLaunches = self->_positiveAppLaunches, !((unint64_t)positiveAppLaunches | v4[5]))
     || -[NSMutableArray isEqual:](positiveAppLaunches, "isEqual:"))
    && ((positiveActions = self->_positiveActions, !((unint64_t)positiveActions | v4[4]))
     || -[NSMutableArray isEqual:](positiveActions, "isEqual:"))
    && ((negativeAppLaunches = self->_negativeAppLaunches, !((unint64_t)negativeAppLaunches | v4[3]))
     || -[NSMutableArray isEqual:](negativeAppLaunches, "isEqual:")))
  {
    negativeActions = self->_negativeActions;
    if ((unint64_t)negativeActions | v4[2])
      v11 = -[NSMutableArray isEqual:](negativeActions, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_userId, "hash");
  v4 = -[ATXAnchorModelPBAnchorMetadata hash](self->_anchor, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_positiveAppLaunches, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_positiveActions, "hash");
  v7 = -[NSMutableArray hash](self->_negativeAppLaunches, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_negativeActions, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ATXAnchorModelPBAnchorMetadata *anchor;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  id v22;
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
  if (*((_QWORD *)v4 + 6))
    -[ATXAnchorModelPBAnchorModelLogEntry setUserId:](self, "setUserId:");
  anchor = self->_anchor;
  v6 = *((_QWORD *)v4 + 1);
  if (anchor)
  {
    if (v6)
      -[ATXAnchorModelPBAnchorMetadata mergeFrom:](anchor, "mergeFrom:");
  }
  else if (v6)
  {
    -[ATXAnchorModelPBAnchorModelLogEntry setAnchor:](self, "setAnchor:");
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = *((id *)v4 + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
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
        -[ATXAnchorModelPBAnchorModelLogEntry addPositiveAppLaunches:](self, "addPositiveAppLaunches:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v9);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = *((id *)v4 + 4);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
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
        -[ATXAnchorModelPBAnchorModelLogEntry addPositiveActions:](self, "addPositiveActions:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v14);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = *((id *)v4 + 3);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
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
        -[ATXAnchorModelPBAnchorModelLogEntry addNegativeAppLaunches:](self, "addNegativeAppLaunches:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v19);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = *((id *)v4 + 2);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
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
        -[ATXAnchorModelPBAnchorModelLogEntry addNegativeActions:](self, "addNegativeActions:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * m), (_QWORD)v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v24);
  }

}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
  objc_storeStrong((id *)&self->_userId, a3);
}

- (ATXAnchorModelPBAnchorMetadata)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_anchor, a3);
}

- (NSMutableArray)positiveAppLaunches
{
  return self->_positiveAppLaunches;
}

- (void)setPositiveAppLaunches:(id)a3
{
  objc_storeStrong((id *)&self->_positiveAppLaunches, a3);
}

- (NSMutableArray)positiveActions
{
  return self->_positiveActions;
}

- (void)setPositiveActions:(id)a3
{
  objc_storeStrong((id *)&self->_positiveActions, a3);
}

- (NSMutableArray)negativeAppLaunches
{
  return self->_negativeAppLaunches;
}

- (void)setNegativeAppLaunches:(id)a3
{
  objc_storeStrong((id *)&self->_negativeAppLaunches, a3);
}

- (NSMutableArray)negativeActions
{
  return self->_negativeActions;
}

- (void)setNegativeActions:(id)a3
{
  objc_storeStrong((id *)&self->_negativeActions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_positiveAppLaunches, 0);
  objc_storeStrong((id *)&self->_positiveActions, 0);
  objc_storeStrong((id *)&self->_negativeAppLaunches, 0);
  objc_storeStrong((id *)&self->_negativeActions, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

@end
