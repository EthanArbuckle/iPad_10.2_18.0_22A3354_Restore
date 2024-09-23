@implementation ADClientSettingsResponse

- (NSMutableArray)searchLandingAdsSettingsParams
{
  return self->_searchLandingAdsSettingsParams;
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_expirationDate);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("expirationDate"));

  }
  if (-[NSMutableArray count](self->_searchAdsSettingsParams, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_searchAdsSettingsParams, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = self->_searchAdsSettingsParams;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v10), "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("searchAdsSettingsParams"));
  }
  if (-[NSMutableArray count](self->_searchLandingAdsSettingsParams, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_searchLandingAdsSettingsParams, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = self->_searchLandingAdsSettingsParams;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "dictionaryRepresentation", (_QWORD)v20);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("searchLandingAdsSettingsParams"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ADClientSettingsResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)addSearchLandingAdsSettingsParams:(id)a3
{
  id v4;
  NSMutableArray *searchLandingAdsSettingsParams;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  searchLandingAdsSettingsParams = self->_searchLandingAdsSettingsParams;
  v8 = v4;
  if (!searchLandingAdsSettingsParams)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_searchLandingAdsSettingsParams;
    self->_searchLandingAdsSettingsParams = v6;

    v4 = v8;
    searchLandingAdsSettingsParams = self->_searchLandingAdsSettingsParams;
  }
  -[NSMutableArray addObject:](searchLandingAdsSettingsParams, "addObject:", v4);

}

- (void)addSearchAdsSettingsParams:(id)a3
{
  id v4;
  NSMutableArray *searchAdsSettingsParams;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  searchAdsSettingsParams = self->_searchAdsSettingsParams;
  v8 = v4;
  if (!searchAdsSettingsParams)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_searchAdsSettingsParams;
    self->_searchAdsSettingsParams = v6;

    v4 = v8;
    searchAdsSettingsParams = self->_searchAdsSettingsParams;
  }
  -[NSMutableArray addObject:](searchAdsSettingsParams, "addObject:", v4);

}

- (NSMutableArray)searchAdsSettingsParams
{
  return self->_searchAdsSettingsParams;
}

- (BOOL)hasExpirationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setExpirationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_expirationDate = a3;
}

- (void)setHasExpirationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)clearSearchAdsSettingsParams
{
  -[NSMutableArray removeAllObjects](self->_searchAdsSettingsParams, "removeAllObjects");
}

- (unint64_t)searchAdsSettingsParamsCount
{
  return -[NSMutableArray count](self->_searchAdsSettingsParams, "count");
}

- (id)searchAdsSettingsParamsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_searchAdsSettingsParams, "objectAtIndex:", a3);
}

+ (Class)searchAdsSettingsParamsType
{
  return (Class)objc_opt_class();
}

- (void)clearSearchLandingAdsSettingsParams
{
  -[NSMutableArray removeAllObjects](self->_searchLandingAdsSettingsParams, "removeAllObjects");
}

- (unint64_t)searchLandingAdsSettingsParamsCount
{
  return -[NSMutableArray count](self->_searchLandingAdsSettingsParams, "count");
}

- (id)searchLandingAdsSettingsParamsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_searchLandingAdsSettingsParams, "objectAtIndex:", a3);
}

+ (Class)searchLandingAdsSettingsParamsType
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
  v8.super_class = (Class)ADClientSettingsResponse;
  -[ADClientSettingsResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADClientSettingsResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_searchAdsSettingsParams;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_searchLandingAdsSettingsParams;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

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
  id v13;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_expirationDate;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v13 = v4;
  if (-[ADClientSettingsResponse searchAdsSettingsParamsCount](self, "searchAdsSettingsParamsCount"))
  {
    objc_msgSend(v13, "clearSearchAdsSettingsParams");
    v5 = -[ADClientSettingsResponse searchAdsSettingsParamsCount](self, "searchAdsSettingsParamsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ADClientSettingsResponse searchAdsSettingsParamsAtIndex:](self, "searchAdsSettingsParamsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSearchAdsSettingsParams:", v8);

      }
    }
  }
  if (-[ADClientSettingsResponse searchLandingAdsSettingsParamsCount](self, "searchLandingAdsSettingsParamsCount"))
  {
    objc_msgSend(v13, "clearSearchLandingAdsSettingsParams");
    v9 = -[ADClientSettingsResponse searchLandingAdsSettingsParamsCount](self, "searchLandingAdsSettingsParamsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[ADClientSettingsResponse searchLandingAdsSettingsParamsAtIndex:](self, "searchLandingAdsSettingsParamsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSearchLandingAdsSettingsParams:", v12);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_expirationDate;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = self->_searchAdsSettingsParams;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend(v6, "addSearchAdsSettingsParams:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_searchLandingAdsSettingsParams;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend(v6, "addSearchLandingAdsSettingsParams:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *searchAdsSettingsParams;
  NSMutableArray *searchLandingAdsSettingsParams;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_expirationDate != *((double *)v4 + 1))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  searchAdsSettingsParams = self->_searchAdsSettingsParams;
  if ((unint64_t)searchAdsSettingsParams | *((_QWORD *)v4 + 2)
    && !-[NSMutableArray isEqual:](searchAdsSettingsParams, "isEqual:"))
  {
    goto LABEL_11;
  }
  searchLandingAdsSettingsParams = self->_searchLandingAdsSettingsParams;
  if ((unint64_t)searchLandingAdsSettingsParams | *((_QWORD *)v4 + 3))
    v7 = -[NSMutableArray isEqual:](searchLandingAdsSettingsParams, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  double expirationDate;
  double v5;
  long double v6;
  double v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    expirationDate = self->_expirationDate;
    v5 = -expirationDate;
    if (expirationDate >= 0.0)
      v5 = self->_expirationDate;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSMutableArray hash](self->_searchAdsSettingsParams, "hash") ^ v3;
  return v8 ^ -[NSMutableArray hash](self->_searchLandingAdsSettingsParams, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_expirationDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        -[ADClientSettingsResponse addSearchAdsSettingsParams:](self, "addSearchAdsSettingsParams:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v5[3];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[ADClientSettingsResponse addSearchLandingAdsSettingsParams:](self, "addSearchLandingAdsSettingsParams:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)setSearchAdsSettingsParams:(id)a3
{
  objc_storeStrong((id *)&self->_searchAdsSettingsParams, a3);
}

- (void)setSearchLandingAdsSettingsParams:(id)a3
{
  objc_storeStrong((id *)&self->_searchLandingAdsSettingsParams, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchLandingAdsSettingsParams, 0);
  objc_storeStrong((id *)&self->_searchAdsSettingsParams, 0);
}

@end
