@implementation HMMStateTracker

- (id)initAutoStopPreviousState:(BOOL)a3
{
  HMMStateTracker *v4;
  HMMStateTracker *v5;
  uint64_t v6;
  NSMutableDictionary *openStates;
  uint64_t v8;
  NSMutableArray *closedStates;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMMStateTracker;
  v4 = -[HMMStateTracker init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_autoStopPreviousState = a3;
    v4->_started = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    openStates = v5->_openStates;
    v5->_openStates = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    closedStates = v5->_closedStates;
    v5->_closedStates = (NSMutableArray *)v8;

  }
  return v5;
}

- (void)startWithTime:(unint64_t)a3
{
  self->_startTime = a3;
  self->_started = 1;
}

- (void)endWithTime:(unint64_t)a3
{
  void *v5;
  HMMStateTracker *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMMStateTracker *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_started)
  {
    self->_started = 0;
    if (-[HMMStateTracker startTime](self, "startTime") <= a3)
    {
      self->_totalDuration = a3 - -[HMMStateTracker startTime](self, "startTime");
    }
    else
    {
      v5 = (void *)MEMORY[0x1D17B78FC]();
      v6 = self;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v8;
        _os_log_impl(&dword_1CD029000, v7, OS_LOG_TYPE_ERROR, "%{public}@State tracker end time less than start time", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
    }
    -[HMMStateTracker openStates](self, "openStates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[HMMStateTracker openStates](self, "openStates", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allValues");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v25 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if (-[HMMStateTracker autoStopPreviousState](self, "autoStopPreviousState"))
            {
              -[HMMStateTracker _exitState:exitTime:exitData:](self, "_exitState:exitTime:exitData:", v22, a3, 0);
            }
            else
            {
              objc_msgSend(v22, "forceExit:", a3);
              -[HMMStateTracker closedStates](self, "closedStates");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "addObject:", v22);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v19);
      }

      -[HMMStateTracker updateStateDuration:](self, "updateStateDuration:", a3);
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17B78FC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMStateTracker states](v10, "states");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v12;
      v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_1CD029000, v11, OS_LOG_TYPE_ERROR, "%{public}@Trying to end a state tracker that is already closed with states %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
}

- (void)enterState:(id)a3 enterTime:(unint64_t)a4 enterData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HMMStateTracker *v19;
  NSObject *v20;
  void *v21;
  HMMStateData *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!-[HMMStateTracker isStarted](self, "isStarted"))
    -[HMMStateTracker startWithTime:](self, "startWithTime:", a4);
  -[HMMStateTracker openStates](self, "openStates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (-[HMMStateTracker autoStopPreviousState](self, "autoStopPreviousState") && v11)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v10, "allValues", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          -[HMMStateTracker _exitState:exitTime:exitData:](self, "_exitState:exitTime:exitData:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16++), a4, 0);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v14);
    }

    objc_msgSend(v10, "removeAllObjects");
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x1D17B78FC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v21;
      v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_1CD029000, v20, OS_LOG_TYPE_ERROR, "%{public}@State %@ has already been entered", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
  }
  else
  {
    v22 = -[HMMStateData initWithName:enterTime:enterData:]([HMMStateData alloc], "initWithName:enterTime:enterData:", v8, a4, v9);
    objc_msgSend(v10, "setObject:forKey:", v22, v8);
    v23 = objc_msgSend(v10, "count");
    if (v11 || !v23)
    {
      if (v11 && !v23)
        -[HMMStateTracker updateStateDuration:](self, "updateStateDuration:", a4);
    }
    else
    {
      -[HMMStateTracker setStateEntryTransitionTime:](self, "setStateEntryTransitionTime:", a4);
    }

  }
}

- (void)exitState:(id)a3 exitTime:(unint64_t)a4 exitData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMMStateTracker *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[HMMStateTracker openStates](self, "openStates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMMStateTracker _exitState:exitTime:exitData:](self, "_exitState:exitTime:exitData:", v11, a4, v9);
    -[HMMStateTracker openStates](self, "openStates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v8);

    -[HMMStateTracker openStates](self, "openStates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (!v14)
      -[HMMStateTracker updateStateDuration:](self, "updateStateDuration:", a4);
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17B78FC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v18;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1CD029000, v17, OS_LOG_TYPE_ERROR, "%{public}@Exiting state %@ that hasn't been entered", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)_exitState:(id)a3 exitTime:(unint64_t)a4 exitData:(id)a5
{
  void *v9;
  unint64_t v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "exitTime:exitData:", a4, a5);
  -[HMMStateTracker closedStates](self, "closedStates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v11);

  v10 = objc_msgSend(v11, "duration");
  if (v10 > -[HMMStateTracker longestStateDuration](self, "longestStateDuration"))
  {
    objc_storeStrong((id *)&self->_longestState, a3);
    -[HMMStateTracker setLongestStateDuration:](self, "setLongestStateDuration:", objc_msgSend(v11, "duration"));
  }

}

- (void)updateStateDuration:(unint64_t)a3
{
  if (-[HMMStateTracker stateEntryTransitionTime](self, "stateEntryTransitionTime") < a3)
    self->_totalStateDuration += a3 - -[HMMStateTracker stateEntryTransitionTime](self, "stateEntryTransitionTime");
}

- (NSArray)states
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_closedStates, "copy");
}

- (BOOL)isStarted
{
  return self->_started;
}

- (unint64_t)totalDuration
{
  return self->_totalDuration;
}

- (unint64_t)totalStateDuration
{
  return self->_totalStateDuration;
}

- (HMMStateData)longestState
{
  return self->_longestState;
}

- (BOOL)autoStopPreviousState
{
  return self->_autoStopPreviousState;
}

- (void)setAutoStopPreviousState:(BOOL)a3
{
  self->_autoStopPreviousState = a3;
}

- (NSMutableDictionary)openStates
{
  return self->_openStates;
}

- (void)setOpenStates:(id)a3
{
  objc_storeStrong((id *)&self->_openStates, a3);
}

- (NSMutableArray)closedStates
{
  return self->_closedStates;
}

- (void)setClosedStates:(id)a3
{
  objc_storeStrong((id *)&self->_closedStates, a3);
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (unint64_t)stateEntryTransitionTime
{
  return self->_stateEntryTransitionTime;
}

- (void)setStateEntryTransitionTime:(unint64_t)a3
{
  self->_stateEntryTransitionTime = a3;
}

- (unint64_t)longestStateDuration
{
  return self->_longestStateDuration;
}

- (void)setLongestStateDuration:(unint64_t)a3
{
  self->_longestStateDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closedStates, 0);
  objc_storeStrong((id *)&self->_openStates, 0);
  objc_storeStrong((id *)&self->_longestState, 0);
}

@end
