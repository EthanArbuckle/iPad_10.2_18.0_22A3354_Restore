@implementation ADClientSettingsRequest

+ (id)options
{
  if (options_once_2 != -1)
    dispatch_once(&options_once_2, &__block_literal_global_4);
  return (id)options_sOptions_2;
}

void __34__ADClientSettingsRequest_options__block_invoke()
{
  void *v0;

  v0 = (void *)options_sOptions_2;
  options_sOptions_2 = (uint64_t)&unk_1E82BEBD8;

}

- (BOOL)hasIAdIDString
{
  return self->_iAdIDString != 0;
}

- (void)clearCurrentSettingParams
{
  -[NSMutableArray removeAllObjects](self->_currentSettingParams, "removeAllObjects");
}

- (void)addCurrentSettingParams:(id)a3
{
  id v4;
  NSMutableArray *currentSettingParams;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  currentSettingParams = self->_currentSettingParams;
  v8 = v4;
  if (!currentSettingParams)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_currentSettingParams;
    self->_currentSettingParams = v6;

    v4 = v8;
    currentSettingParams = self->_currentSettingParams;
  }
  -[NSMutableArray addObject:](currentSettingParams, "addObject:", v4);

}

- (unint64_t)currentSettingParamsCount
{
  return -[NSMutableArray count](self->_currentSettingParams, "count");
}

- (id)currentSettingParamsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_currentSettingParams, "objectAtIndex:", a3);
}

+ (Class)currentSettingParamsType
{
  return (Class)objc_opt_class();
}

- (void)clearCurrentSearchLandingAdsSettingParams
{
  -[NSMutableArray removeAllObjects](self->_currentSearchLandingAdsSettingParams, "removeAllObjects");
}

- (void)addCurrentSearchLandingAdsSettingParams:(id)a3
{
  id v4;
  NSMutableArray *currentSearchLandingAdsSettingParams;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  currentSearchLandingAdsSettingParams = self->_currentSearchLandingAdsSettingParams;
  v8 = v4;
  if (!currentSearchLandingAdsSettingParams)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_currentSearchLandingAdsSettingParams;
    self->_currentSearchLandingAdsSettingParams = v6;

    v4 = v8;
    currentSearchLandingAdsSettingParams = self->_currentSearchLandingAdsSettingParams;
  }
  -[NSMutableArray addObject:](currentSearchLandingAdsSettingParams, "addObject:", v4);

}

- (unint64_t)currentSearchLandingAdsSettingParamsCount
{
  return -[NSMutableArray count](self->_currentSearchLandingAdsSettingParams, "count");
}

- (id)currentSearchLandingAdsSettingParamsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_currentSearchLandingAdsSettingParams, "objectAtIndex:", a3);
}

+ (Class)currentSearchLandingAdsSettingParamsType
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
  v8.super_class = (Class)ADClientSettingsRequest;
  -[ADClientSettingsRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADClientSettingsRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *iAdIDString;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  iAdIDString = self->_iAdIDString;
  if (iAdIDString)
    objc_msgSend(v3, "setObject:forKey:", iAdIDString, CFSTR("iAdIDString"));
  if (-[NSMutableArray count](self->_currentSettingParams, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_currentSettingParams, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = self->_currentSettingParams;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("currentSettingParams"));
  }
  if (-[NSMutableArray count](self->_currentSearchLandingAdsSettingParams, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_currentSearchLandingAdsSettingParams, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = self->_currentSearchLandingAdsSettingParams;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("currentSearchLandingAdsSettingParams"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ADClientSettingsRequestReadFrom(self, (uint64_t)a3);
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
  if (self->_iAdIDString)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_currentSettingParams;
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
  v10 = self->_currentSearchLandingAdsSettingParams;
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
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id v12;

  v12 = a3;
  if (self->_iAdIDString)
    objc_msgSend(v12, "setIAdIDString:");
  if (-[ADClientSettingsRequest currentSettingParamsCount](self, "currentSettingParamsCount"))
  {
    objc_msgSend(v12, "clearCurrentSettingParams");
    v4 = -[ADClientSettingsRequest currentSettingParamsCount](self, "currentSettingParamsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ADClientSettingsRequest currentSettingParamsAtIndex:](self, "currentSettingParamsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addCurrentSettingParams:", v7);

      }
    }
  }
  if (-[ADClientSettingsRequest currentSearchLandingAdsSettingParamsCount](self, "currentSearchLandingAdsSettingParamsCount"))
  {
    objc_msgSend(v12, "clearCurrentSearchLandingAdsSettingParams");
    v8 = -[ADClientSettingsRequest currentSearchLandingAdsSettingParamsCount](self, "currentSearchLandingAdsSettingParamsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[ADClientSettingsRequest currentSearchLandingAdsSettingParamsAtIndex:](self, "currentSearchLandingAdsSettingParamsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addCurrentSearchLandingAdsSettingParams:", v11);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_iAdIDString, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_currentSettingParams;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend(v5, "addCurrentSettingParams:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_currentSearchLandingAdsSettingParams;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend(v5, "addCurrentSearchLandingAdsSettingParams:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *iAdIDString;
  NSMutableArray *currentSettingParams;
  NSMutableArray *currentSearchLandingAdsSettingParams;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((iAdIDString = self->_iAdIDString, !((unint64_t)iAdIDString | v4[3]))
     || -[NSString isEqual:](iAdIDString, "isEqual:"))
    && ((currentSettingParams = self->_currentSettingParams, !((unint64_t)currentSettingParams | v4[2]))
     || -[NSMutableArray isEqual:](currentSettingParams, "isEqual:")))
  {
    currentSearchLandingAdsSettingParams = self->_currentSearchLandingAdsSettingParams;
    if ((unint64_t)currentSearchLandingAdsSettingParams | v4[1])
      v8 = -[NSMutableArray isEqual:](currentSearchLandingAdsSettingParams, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_iAdIDString, "hash");
  v4 = -[NSMutableArray hash](self->_currentSettingParams, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_currentSearchLandingAdsSettingParams, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
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
  if (*((_QWORD *)v4 + 3))
    -[ADClientSettingsRequest setIAdIDString:](self, "setIAdIDString:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[ADClientSettingsRequest addCurrentSettingParams:](self, "addCurrentSettingParams:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 1);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[ADClientSettingsRequest addCurrentSearchLandingAdsSettingParams:](self, "addCurrentSearchLandingAdsSettingParams:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (NSString)iAdIDString
{
  return self->_iAdIDString;
}

- (void)setIAdIDString:(id)a3
{
  objc_storeStrong((id *)&self->_iAdIDString, a3);
}

- (NSMutableArray)currentSettingParams
{
  return self->_currentSettingParams;
}

- (void)setCurrentSettingParams:(id)a3
{
  objc_storeStrong((id *)&self->_currentSettingParams, a3);
}

- (NSMutableArray)currentSearchLandingAdsSettingParams
{
  return self->_currentSearchLandingAdsSettingParams;
}

- (void)setCurrentSearchLandingAdsSettingParams:(id)a3
{
  objc_storeStrong((id *)&self->_currentSearchLandingAdsSettingParams, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iAdIDString, 0);
  objc_storeStrong((id *)&self->_currentSettingParams, 0);
  objc_storeStrong((id *)&self->_currentSearchLandingAdsSettingParams, 0);
}

@end
