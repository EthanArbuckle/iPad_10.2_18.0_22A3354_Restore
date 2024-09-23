@implementation _ATXAppLaunchSequence

- (_ATXAppLaunchSequence)initWithPreviousLaunch:(id)a3 dataStore:(id)a4
{
  return -[_ATXAppLaunchSequence initWithPreviousLaunch:dataStore:allowSimulatedCrashes:](self, "initWithPreviousLaunch:dataStore:allowSimulatedCrashes:", a3, a4, 1);
}

- (_ATXAppLaunchSequence)initWithPreviousLaunch:(id)a3 dataStore:(id)a4 allowSimulatedCrashes:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  _ATXAppLaunchSequence *v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "loadLaunchesFollowingBundle:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_ATXAppLaunchSequence initWithPreviousLaunch:subsequentLaunchCounts:dataStore:allowSimulatedCrashes:launchType:](self, "initWithPreviousLaunch:subsequentLaunchCounts:dataStore:allowSimulatedCrashes:launchType:", v9, v10, v8, v5, 0);

  return v11;
}

- (_ATXAppLaunchSequence)initWithPreviousLaunch:(id)a3 subsequentLaunchCounts:(id)a4 dataStore:(id)a5 allowSimulatedCrashes:(BOOL)a6 launchType:(int)a7
{
  _BOOL4 v8;
  id v13;
  id v14;
  id v15;
  _ATXAppLaunchSequence *v16;
  _ATXAppLaunchSequence *v17;
  uint64_t v18;
  NSMutableDictionary *subsequentLaunchCountMap;
  void *v20;
  NSMutableDictionary *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  NSMutableDictionary *v30;
  void *v31;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v8 = a6;
  v41 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v39.receiver = self;
  v39.super_class = (Class)_ATXAppLaunchSequence;
  v16 = -[_ATXAppLaunchSequence init](&v39, sel_init);
  v17 = v16;
  if (!v16)
    goto LABEL_17;
  v33 = v15;
  v16->_launchType = a7;
  objc_storeStrong((id *)&v16->_previousLaunch, a3);
  objc_storeStrong((id *)&v17->_datastore, a5);
  v34 = v14;
  v18 = objc_msgSend(v14, "mutableCopy");
  subsequentLaunchCountMap = v17->_subsequentLaunchCountMap;
  v17->_subsequentLaunchCountMap = (NSMutableDictionary *)v18;

  v17->_previousAppDeleted = 0;
  pthread_rwlock_init(&v17->_rwlock, 0);
  v20 = (void *)objc_opt_new();
  v17->_subsequentLaunchTotalCount = 0.0;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = v17->_subsequentLaunchCountMap;
  v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (!v22)
    goto LABEL_14;
  v23 = v22;
  v24 = *(_QWORD *)v36;
  do
  {
    for (i = 0; i != v23; ++i)
    {
      if (*(_QWORD *)v36 != v24)
        objc_enumerationMutation(v21);
      v26 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
      -[NSMutableDictionary objectForKeyedSubscript:](v17->_subsequentLaunchCountMap, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](v17->_subsequentLaunchCountMap, "objectForKeyedSubscript:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "doubleValue");
        v17->_subsequentLaunchTotalCount = v29 + v17->_subsequentLaunchTotalCount;
      }
      else
      {
        objc_msgSend(v20, "addObject:", v26);
        if (!v8)
          goto LABEL_12;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Launch count not of type NSNumber. Of type: %@"), objc_opt_class());
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D81568], "simulateCrashWithDescription:", v28);
      }

LABEL_12:
    }
    v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  }
  while (v23);
LABEL_14:

  if (objc_msgSend(v20, "count"))
  {
    v30 = v17->_subsequentLaunchCountMap;
    objc_msgSend(v20, "allObjects");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectsForKeys:](v30, "removeObjectsForKeys:", v31);

    -[_ATXAppLaunchSequence save](v17, "save");
  }

  v14 = v34;
  v15 = v33;
LABEL_17:

  return v17;
}

- (_ATXAppLaunchSequence)initWithPreviousAppActionLaunch:(id)a3 dataStore:(id)a4
{
  return -[_ATXAppLaunchSequence initWithPreviousAppActionLaunch:dataStore:allowSimulatedCrashes:](self, "initWithPreviousAppActionLaunch:dataStore:allowSimulatedCrashes:", a3, a4, 1);
}

- (_ATXAppLaunchSequence)initWithPreviousAppActionLaunch:(id)a3 dataStore:(id)a4 allowSimulatedCrashes:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  _ATXAppLaunchSequence *v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "loadAppActionLaunchesFollowing:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_ATXAppLaunchSequence initWithPreviousAppActionLaunch:subsequentAppActionLaunchCounts:dataStore:allowSimulatedCrashes:](self, "initWithPreviousAppActionLaunch:subsequentAppActionLaunchCounts:dataStore:allowSimulatedCrashes:", v9, v10, v8, v5);

  return v11;
}

- (_ATXAppLaunchSequence)initWithPreviousAppActionLaunch:(id)a3 subsequentAppActionLaunchCounts:(id)a4 dataStore:(id)a5 allowSimulatedCrashes:(BOOL)a6
{
  return -[_ATXAppLaunchSequence initWithPreviousLaunch:subsequentLaunchCounts:dataStore:allowSimulatedCrashes:launchType:](self, "initWithPreviousLaunch:subsequentLaunchCounts:dataStore:allowSimulatedCrashes:launchType:", a3, a4, a5, a6, 1);
}

- (void)dealloc
{
  objc_super v3;

  pthread_rwlock_destroy(&self->_rwlock);
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppLaunchSequence;
  -[_ATXAppLaunchSequence dealloc](&v3, sel_dealloc);
}

- (void)addSubsequentLaunch:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  id v8;

  v8 = a3;
  pthread_rwlock_wrlock(&self->_rwlock);
  if (!self->_previousAppDeleted)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[NSMutableDictionary objectForKeyedSubscript:](self->_subsequentLaunchCountMap, "objectForKeyedSubscript:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v4, "numberWithDouble:", v6 + 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subsequentLaunchCountMap, "setObject:forKeyedSubscript:", v7, v8);

    self->_subsequentLaunchTotalCount = self->_subsequentLaunchTotalCount + 1.0;
    -[_ATXAppLaunchSequence save](self, "save");
  }
  pthread_rwlock_unlock(&self->_rwlock);

}

- (void)deleteDataForLaunch:(id)a3
{
  id v4;

  v4 = a3;
  pthread_rwlock_wrlock(&self->_rwlock);
  if (!self->_previousAppDeleted)
  {
    -[_ATXAppLaunchSequence _deleteDataForLaunchLocked:](self, "_deleteDataForLaunchLocked:", v4);
    -[_ATXAppLaunchSequence save](self, "save");
  }
  pthread_rwlock_unlock(&self->_rwlock);

}

- (void)deleteDataForLaunches:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pthread_rwlock_wrlock(&self->_rwlock);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[_ATXAppLaunchSequence _deleteDataForLaunchLocked:](self, "_deleteDataForLaunchLocked:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[_ATXAppLaunchSequence save](self, "save");
  pthread_rwlock_unlock(&self->_rwlock);

}

- (void)_deleteDataForLaunchLocked:(id)a3
{
  NSMutableDictionary *subsequentLaunchCountMap;
  id v5;
  void *v6;
  double v7;
  double v8;

  subsequentLaunchCountMap = self->_subsequentLaunchCountMap;
  v5 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](subsequentLaunchCountMap, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  -[NSMutableDictionary removeObjectForKey:](self->_subsequentLaunchCountMap, "removeObjectForKey:", v5);
  self->_subsequentLaunchTotalCount = self->_subsequentLaunchTotalCount - v8;
}

- (double)launchCount:(id)a3
{
  id v4;
  _opaque_pthread_rwlock_t *p_rwlock;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  if (self->_previousAppDeleted)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_subsequentLaunchCountMap, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  pthread_rwlock_unlock(p_rwlock);
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (double)likelihoodForLaunch:(id)a3
{
  id v4;
  double v5;
  void *v6;
  double v7;

  v4 = a3;
  pthread_rwlock_rdlock(&self->_rwlock);
  v5 = 0.0;
  if (!self->_previousAppDeleted && self->_subsequentLaunchTotalCount != 0.0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_subsequentLaunchCountMap, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v5 = v7 / self->_subsequentLaunchTotalCount;

  }
  pthread_rwlock_unlock(&self->_rwlock);

  return v5;
}

- (void)decayByFactor:(double)a3
{
  _opaque_pthread_rwlock_t *p_rwlock;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_rwlock = &self->_rwlock;
  v6 = pthread_rwlock_wrlock(&self->_rwlock);
  if (!self->_previousAppDeleted)
  {
    v7 = (void *)MEMORY[0x1CAA48B6C](v6);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[NSMutableDictionary allKeys](self->_subsequentLaunchCountMap, "allKeys", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_subsequentLaunchCountMap, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          v16 = v15;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 * a3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subsequentLaunchCountMap, "setObject:forKeyedSubscript:", v17, v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    self->_subsequentLaunchTotalCount = self->_subsequentLaunchTotalCount * a3;
    -[_ATXAppLaunchSequence save](self, "save");
    objc_autoreleasePoolPop(v7);
  }
  pthread_rwlock_unlock(p_rwlock);
}

- (void)decayWithHalfLifeInDays:(double)a3
{
  -[_ATXAppLaunchSequence decayByFactor:](self, "decayByFactor:", (double)exp2(-1.0 / a3));
}

- (void)save
{
  int launchType;

  if (self->_subsequentLaunchCountMap)
  {
    launchType = self->_launchType;
    if (launchType == 1)
    {
      -[_ATXDataStore writeAppActionLaunches:followingAppAction:](self->_datastore, "writeAppActionLaunches:followingAppAction:");
    }
    else if (!launchType)
    {
      -[_ATXDataStore writeLaunches:followingBundle:](self->_datastore, "writeLaunches:followingBundle:");
    }
  }
}

- (void)deleteAllInformation
{
  _opaque_pthread_rwlock_t *p_rwlock;
  int launchType;
  NSString *previousLaunch;
  NSMutableDictionary *subsequentLaunchCountMap;

  p_rwlock = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  launchType = self->_launchType;
  if (launchType == 1)
  {
    -[_ATXDataStore deleteLaunchesFollowingAppAction:](self->_datastore, "deleteLaunchesFollowingAppAction:", self->_previousLaunch);
  }
  else if (!launchType)
  {
    -[_ATXDataStore deleteLaunchesFollowingBundle:](self->_datastore, "deleteLaunchesFollowingBundle:", self->_previousLaunch);
  }
  self->_previousAppDeleted = 1;
  self->_subsequentLaunchTotalCount = 0.0;
  previousLaunch = self->_previousLaunch;
  self->_previousLaunch = 0;

  subsequentLaunchCountMap = self->_subsequentLaunchCountMap;
  self->_subsequentLaunchCountMap = 0;

  self->_launchType = -1;
  pthread_rwlock_unlock(p_rwlock);
}

- (double)subsequentLaunchTotalCount
{
  return self->_subsequentLaunchTotalCount;
}

- (BOOL)previousAppDeleted
{
  return self->_previousAppDeleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsequentLaunchCountMap, 0);
  objc_storeStrong((id *)&self->_previousLaunch, 0);
  objc_storeStrong((id *)&self->_datastore, 0);
}

@end
