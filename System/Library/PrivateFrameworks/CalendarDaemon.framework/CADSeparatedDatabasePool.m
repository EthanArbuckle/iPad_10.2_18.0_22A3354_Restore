@implementation CADSeparatedDatabasePool

- (CADSeparatedDatabasePool)initWithConfig:(id)a3 databaseID:(int)a4
{
  id v7;
  CADSeparatedDatabasePool *v8;
  CADSeparatedDatabasePool *v9;
  void *v10;
  uint64_t v11;
  NSString *databasePath;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  NSMutableArray *connections;
  objc_super v18;

  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CADSeparatedDatabasePool;
  v8 = -[CADSeparatedDatabasePool init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_config, a3);
    objc_msgSend(v7, "directoryURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = objc_claimAutoreleasedReturnValue();
    databasePath = v9->_databasePath;
    v9->_databasePath = (NSString *)v11;

    if (!-[NSString hasSuffix:](v9->_databasePath, "hasSuffix:", CFSTR("/")))
    {
      -[NSString stringByAppendingString:](v9->_databasePath, "stringByAppendingString:", CFSTR("/"));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v9->_databasePath;
      v9->_databasePath = (NSString *)v13;

    }
    v9->_databaseID = a4;
    v15 = objc_opt_new();
    connections = v9->_connections;
    v9->_connections = (NSMutableArray *)v15;

  }
  return v9;
}

- (void)_returnConnectionToPool:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setLastUsedTimestamp:", CalApproximateContinuousTime());
  -[NSMutableArray addObject:](self->_connections, "addObject:", v4);

}

- (void)purgeConnectionsLastUsedPriorTo:(unint64_t)a3 stats:(id *)a4
{
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  unint64_t v14;
  unint64_t var2;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_connections;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v8)
  {
    v11 = v7;
    goto LABEL_18;
  }
  v9 = v8;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v17 != v12)
        objc_enumerationMutation(v7);
      v14 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "lastUsedTimestamp", (_QWORD)v16);
      if (v14 >= a3)
      {
        ++a4->var1;
        var2 = a4->var2;
        if (var2 >= v14)
          var2 = v14;
        a4->var2 = var2;
      }
      else
      {
        if (!v11)
          v11 = (void *)objc_opt_new();
        objc_msgSend(v11, "addIndex:", v10 + i);
        ++a4->var0;
      }
    }
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    v10 += i;
  }
  while (v9);

  if (v11)
  {
    -[NSMutableArray removeObjectsAtIndexes:](self->_connections, "removeObjectsAtIndexes:", v11);
LABEL_18:

  }
}

- (CalDatabaseInitializationConfiguration)config
{
  return self->_config;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (int)databaseID
{
  return self->_databaseID;
}

- (unint64_t)lastChangeTimestamp
{
  return self->_lastChangeTimestamp;
}

- (void)setLastChangeTimestamp:(unint64_t)a3
{
  self->_lastChangeTimestamp = a3;
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
