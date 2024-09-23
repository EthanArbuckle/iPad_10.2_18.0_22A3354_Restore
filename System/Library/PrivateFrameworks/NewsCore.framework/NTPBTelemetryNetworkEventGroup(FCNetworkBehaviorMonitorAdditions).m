@implementation NTPBTelemetryNetworkEventGroup(FCNetworkBehaviorMonitorAdditions)

- (id)startDate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  unint64_t v14;
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
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a1, "successes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "startTime");
        if (v8 < v6)
          v6 = v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "failures", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "startTime");
        if (v14 < v6)
          v6 = v14;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "fc_dateWithMillisecondTimeIntervalSince1970:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)endDate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  unint64_t v14;
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
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a1, "successes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "startTime");
        if (v8 > v5)
          v5 = v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "failures", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "startTime");
        if (v14 > v5)
          v5 = v14;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "fc_dateWithMillisecondTimeIntervalSince1970:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (FCNetworkEventStats)totalDurationStats
{
  void *v1;
  void *v2;
  FCNetworkEventStats *v3;

  objc_msgSend(a1, "successes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_282);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = -[FCNetworkEventStats initWithValues:]([FCNetworkEventStats alloc], "initWithValues:", v2);
  return v3;
}

- (FCNetworkEventStats)dnsDurationStats
{
  void *v1;
  void *v2;
  FCNetworkEventStats *v3;

  objc_msgSend(a1, "successes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_284);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = -[FCNetworkEventStats initWithValues:]([FCNetworkEventStats alloc], "initWithValues:", v2);
  return v3;
}

- (FCNetworkEventStats)connectDurationStats
{
  void *v1;
  void *v2;
  FCNetworkEventStats *v3;

  objc_msgSend(a1, "successes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_285);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = -[FCNetworkEventStats initWithValues:]([FCNetworkEventStats alloc], "initWithValues:", v2);
  return v3;
}

- (FCNetworkEventStats)timeToFirstByteStats
{
  void *v1;
  void *v2;
  FCNetworkEventStats *v3;

  objc_msgSend(a1, "successes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_286);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = -[FCNetworkEventStats initWithValues:]([FCNetworkEventStats alloc], "initWithValues:", v2);
  return v3;
}

- (uint64_t)cacheHitCount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "successes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "fc_countOfObjectsPassingTest:", &__block_literal_global_288);

  return v2;
}

- (uint64_t)cacheMissCount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "successes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "fc_countOfObjectsPassingTest:", &__block_literal_global_289);

  return v2;
}

@end
