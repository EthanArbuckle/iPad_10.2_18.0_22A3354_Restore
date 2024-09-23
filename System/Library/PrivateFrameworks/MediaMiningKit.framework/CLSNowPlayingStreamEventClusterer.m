@implementation CLSNowPlayingStreamEventClusterer

- (CLSNowPlayingStreamEventClusterer)init
{
  CLSNowPlayingStreamEventClusteringParameters *v3;
  CLSNowPlayingStreamEventClusterer *v4;

  v3 = objc_alloc_init(CLSNowPlayingStreamEventClusteringParameters);
  v4 = -[CLSNowPlayingStreamEventClusterer initWithClusteringParameters:](self, "initWithClusteringParameters:", v3);

  return v4;
}

- (CLSNowPlayingStreamEventClusterer)initWithClusteringParameters:(id)a3
{
  id v5;
  CLSNowPlayingStreamEventClusterer *v6;
  CLSNowPlayingStreamEventClusterer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSNowPlayingStreamEventClusterer;
  v6 = -[CLSNowPlayingStreamEventClusterer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_clusteringParameters, a3);

  return v7;
}

- (void)clusterEvents:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  v4 = -[CLSNowPlayingStreamEventClusteringParameters algorithm](self->_clusteringParameters, "algorithm");
  if (v4 == 1)
  {
    -[CLSNowPlayingStreamEventClusterer naiveClusterEvents:](self, "naiveClusterEvents:", v5);
  }
  else if (!v4)
  {
    -[CLSNowPlayingStreamEventClusterer dbScanClusterEvents:](self, "dbScanClusterEvents:", v5);
  }

}

- (void)naiveClusterEvents:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *sessions;
  NSArray *v20;
  void *v21;
  id obj;
  _QWORD v24[4];
  NSArray *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v9, "localStartDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[CLSCalendar startOfDayForDate:](CLSCalendar, "startOfDayForDate:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeIntervalSince1970");
        v13 = v12;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v9);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v17);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __56__CLSNowPlayingStreamEventClusterer_naiveClusterEvents___block_invoke;
  v24[3] = &unk_1E84F89D0;
  v18 = v21;
  v25 = v18;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v24);
  sessions = self->_sessions;
  self->_sessions = v18;
  v20 = v18;

}

- (void)dbScanClusterEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  void *v8;
  NSArray *sessions;
  id v10;

  v4 = a3;
  +[CLSNowPlayingStreamEvent playbackStreamEventDateSortDescriptors](CLSNowPlayingStreamEvent, "playbackStreamEventDateSortDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[CLSNowPlayingStreamEventClusterer _dbScanClusterEvents:](self, "_dbScanClusterEvents:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  +[CLSNowPlayingStreamSession playbackStreamSessionDateSortDescriptors](CLSNowPlayingStreamSession, "playbackStreamSessionDateSortDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray sortUsingDescriptors:](v7, "sortUsingDescriptors:", v8);

  sessions = self->_sessions;
  self->_sessions = v7;

}

- (id)_dbScanClusterEvents:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0D71698];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithDistanceBlock:", &__block_literal_global_4634);
  -[CLSNowPlayingStreamEventClusterer clusteringParameters](self, "clusteringParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minimumClusterTimeInSeconds");
  objc_msgSend(v6, "setMaximumDistance:");

  objc_msgSend(v6, "setMinimumNumberOfObjects:", 1);
  objc_msgSend(v6, "performWithDataset:progressBlock:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLSNowPlayingStreamEventClusterer _populateSessionsWithClusters:](self, "_populateSessionsWithClusters:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_populateSessionsWithClusters:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CLSNowPlayingStreamSession *v11;
  CLSNowPlayingStreamSession *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [CLSNowPlayingStreamSession alloc];
        v12 = -[CLSNowPlayingStreamSession initWithDataCluster:](v11, "initWithDataCluster:", v10, (_QWORD)v15);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  +[CLSNowPlayingStreamSession playbackStreamSessionDateSortDescriptors](CLSNowPlayingStreamSession, "playbackStreamSessionDateSortDescriptors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortUsingDescriptors:", v13);

  return v4;
}

- (NSArray)sessions
{
  return self->_sessions;
}

- (CLSNowPlayingStreamEventClusteringParameters)clusteringParameters
{
  return self->_clusteringParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusteringParameters, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

void __58__CLSNowPlayingStreamEventClusterer__dbScanClusterEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a2, "localStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
}

void __56__CLSNowPlayingStreamEventClusterer_naiveClusterEvents___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  CLSNowPlayingStreamSession *v5;

  v4 = a3;
  v5 = -[CLSNowPlayingStreamSession initWithEvents:]([CLSNowPlayingStreamSession alloc], "initWithEvents:", v4);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
}

@end
