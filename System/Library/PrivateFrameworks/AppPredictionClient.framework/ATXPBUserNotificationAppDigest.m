@implementation ATXPBUserNotificationAppDigest

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)clearAppMarqueeGroups
{
  -[NSMutableArray removeAllObjects](self->_appMarqueeGroups, "removeAllObjects");
}

- (void)addAppMarqueeGroups:(id)a3
{
  id v4;
  NSMutableArray *appMarqueeGroups;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  appMarqueeGroups = self->_appMarqueeGroups;
  v8 = v4;
  if (!appMarqueeGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_appMarqueeGroups;
    self->_appMarqueeGroups = v6;

    v4 = v8;
    appMarqueeGroups = self->_appMarqueeGroups;
  }
  -[NSMutableArray addObject:](appMarqueeGroups, "addObject:", v4);

}

- (unint64_t)appMarqueeGroupsCount
{
  return -[NSMutableArray count](self->_appMarqueeGroups, "count");
}

- (id)appMarqueeGroupsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_appMarqueeGroups, "objectAtIndex:", a3);
}

+ (Class)appMarqueeGroupsType
{
  return (Class)objc_opt_class();
}

- (void)clearNonAppMarqueeGroups
{
  -[NSMutableArray removeAllObjects](self->_nonAppMarqueeGroups, "removeAllObjects");
}

- (void)addNonAppMarqueeGroups:(id)a3
{
  id v4;
  NSMutableArray *nonAppMarqueeGroups;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  nonAppMarqueeGroups = self->_nonAppMarqueeGroups;
  v8 = v4;
  if (!nonAppMarqueeGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_nonAppMarqueeGroups;
    self->_nonAppMarqueeGroups = v6;

    v4 = v8;
    nonAppMarqueeGroups = self->_nonAppMarqueeGroups;
  }
  -[NSMutableArray addObject:](nonAppMarqueeGroups, "addObject:", v4);

}

- (unint64_t)nonAppMarqueeGroupsCount
{
  return -[NSMutableArray count](self->_nonAppMarqueeGroups, "count");
}

- (id)nonAppMarqueeGroupsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_nonAppMarqueeGroups, "objectAtIndex:", a3);
}

+ (Class)nonAppMarqueeGroupsType
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
  v8.super_class = (Class)ATXPBUserNotificationAppDigest;
  -[ATXPBUserNotificationAppDigest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBUserNotificationAppDigest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bundleId;
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
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  if (-[NSMutableArray count](self->_appMarqueeGroups, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_appMarqueeGroups, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = self->_appMarqueeGroups;
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

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("appMarqueeGroups"));
  }
  if (-[NSMutableArray count](self->_nonAppMarqueeGroups, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_nonAppMarqueeGroups, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = self->_nonAppMarqueeGroups;
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

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("nonAppMarqueeGroups"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUserNotificationAppDigestReadFrom(self, (uint64_t)a3);
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
  if (self->_bundleId)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_appMarqueeGroups;
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
  v10 = self->_nonAppMarqueeGroups;
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
  if (self->_bundleId)
    objc_msgSend(v12, "setBundleId:");
  if (-[ATXPBUserNotificationAppDigest appMarqueeGroupsCount](self, "appMarqueeGroupsCount"))
  {
    objc_msgSend(v12, "clearAppMarqueeGroups");
    v4 = -[ATXPBUserNotificationAppDigest appMarqueeGroupsCount](self, "appMarqueeGroupsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ATXPBUserNotificationAppDigest appMarqueeGroupsAtIndex:](self, "appMarqueeGroupsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addAppMarqueeGroups:", v7);

      }
    }
  }
  if (-[ATXPBUserNotificationAppDigest nonAppMarqueeGroupsCount](self, "nonAppMarqueeGroupsCount"))
  {
    objc_msgSend(v12, "clearNonAppMarqueeGroups");
    v8 = -[ATXPBUserNotificationAppDigest nonAppMarqueeGroupsCount](self, "nonAppMarqueeGroupsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[ATXPBUserNotificationAppDigest nonAppMarqueeGroupsAtIndex:](self, "nonAppMarqueeGroupsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addNonAppMarqueeGroups:", v11);

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
  v6 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_appMarqueeGroups;
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
        objc_msgSend(v5, "addAppMarqueeGroups:", v13);

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
  v14 = self->_nonAppMarqueeGroups;
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
        objc_msgSend(v5, "addNonAppMarqueeGroups:", v19);

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
  NSString *bundleId;
  NSMutableArray *appMarqueeGroups;
  NSMutableArray *nonAppMarqueeGroups;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((bundleId = self->_bundleId, !((unint64_t)bundleId | v4[2]))
     || -[NSString isEqual:](bundleId, "isEqual:"))
    && ((appMarqueeGroups = self->_appMarqueeGroups, !((unint64_t)appMarqueeGroups | v4[1]))
     || -[NSMutableArray isEqual:](appMarqueeGroups, "isEqual:")))
  {
    nonAppMarqueeGroups = self->_nonAppMarqueeGroups;
    if ((unint64_t)nonAppMarqueeGroups | v4[3])
      v8 = -[NSMutableArray isEqual:](nonAppMarqueeGroups, "isEqual:");
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

  v3 = -[NSString hash](self->_bundleId, "hash");
  v4 = -[NSMutableArray hash](self->_appMarqueeGroups, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_nonAppMarqueeGroups, "hash");
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
  if (*((_QWORD *)v4 + 2))
    -[ATXPBUserNotificationAppDigest setBundleId:](self, "setBundleId:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *((id *)v4 + 1);
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
        -[ATXPBUserNotificationAppDigest addAppMarqueeGroups:](self, "addAppMarqueeGroups:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 3);
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
        -[ATXPBUserNotificationAppDigest addNonAppMarqueeGroups:](self, "addNonAppMarqueeGroups:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSMutableArray)appMarqueeGroups
{
  return self->_appMarqueeGroups;
}

- (void)setAppMarqueeGroups:(id)a3
{
  objc_storeStrong((id *)&self->_appMarqueeGroups, a3);
}

- (NSMutableArray)nonAppMarqueeGroups
{
  return self->_nonAppMarqueeGroups;
}

- (void)setNonAppMarqueeGroups:(id)a3
{
  objc_storeStrong((id *)&self->_nonAppMarqueeGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonAppMarqueeGroups, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_appMarqueeGroups, 0);
}

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXPBUserNotificationAppDigest *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSString *bundleId;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ATXPBUserNotificationAppDigest init](self, "init");
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v8;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appMarqueeGroups"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = -[ATXPBUserNotificationDigestNotificationGroup initFromJSON:]([ATXPBUserNotificationDigestNotificationGroup alloc], "initFromJSON:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v14));
          -[ATXPBUserNotificationAppDigest addAppMarqueeGroups:](v5, "addAppMarqueeGroups:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v12);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nonAppMarqueeGroups"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          v21 = -[ATXPBUserNotificationDigestNotificationGroup initFromJSON:]([ATXPBUserNotificationDigestNotificationGroup alloc], "initFromJSON:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20));
          -[ATXPBUserNotificationAppDigest addNonAppMarqueeGroups:](v5, "addNonAppMarqueeGroups:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v18);
    }

  }
  return v5;
}

- (id)jsonRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("bundleId");
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", self->_bundleId);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("appMarqueeGroups");
  -[NSMutableArray _pas_mappedArrayWithTransform:](self->_appMarqueeGroups, "_pas_mappedArrayWithTransform:", &__block_literal_global_79);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("nonAppMarqueeGroups");
  -[NSMutableArray _pas_mappedArrayWithTransform:](self->_nonAppMarqueeGroups, "_pas_mappedArrayWithTransform:", &__block_literal_global_11_2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __58__ATXPBUserNotificationAppDigest_JSON__jsonRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonRepresentation");
}

uint64_t __58__ATXPBUserNotificationAppDigest_JSON__jsonRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonRepresentation");
}

@end
