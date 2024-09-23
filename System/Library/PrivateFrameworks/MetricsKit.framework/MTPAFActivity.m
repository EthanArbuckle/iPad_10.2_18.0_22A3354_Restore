@implementation MTPAFActivity

- (MTPAFActivity)initWithType:(int64_t)a3 playbackRate:(float)a4 atMilliseconds:(unint64_t)a5 triggerType:(id)a6 reason:(id)a7 eventData:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  MTPAFActivity *v18;
  MTPAFActivity *v19;
  MTPAFActivity *v20;
  MTMediaTimeTracker *v21;
  double v22;
  MTMediaTimeTracker *v23;
  objc_super v25;
  uint8_t buf[16];

  v14 = a6;
  v15 = a7;
  v16 = a8;
  if (a3 == 1)
  {
    MTMetricsKitOSLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D758000, v17, OS_LOG_TYPE_DEBUG, "MetricsKit: MTPAFActivityTypeSeek is not supported yet", buf, 2u);
    }

    v18 = 0;
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)MTPAFActivity;
    v19 = -[MTPAFActivity init](&v25, sel_init);
    v20 = v19;
    if (v19)
    {
      -[MTPAFActivity setActivityType:](v19, "setActivityType:", a3);
      -[MTPAFActivity setStartPosition:](v20, "setStartPosition:", a5);
      -[MTPAFActivity setLastPosition:](v20, "setLastPosition:", a5);
      -[MTPAFActivity setStartTriggerType:](v20, "setStartTriggerType:", v14);
      -[MTPAFActivity setStartReason:](v20, "setStartReason:", v15);
      -[MTPAFActivity setStartEventData:](v20, "setStartEventData:", v16);
      v21 = [MTMediaTimeTracker alloc];
      *(float *)&v22 = a4;
      v23 = -[MTMediaTimeTracker initWithPosition:playbackRate:](v21, "initWithPosition:playbackRate:", a5, v22);
      -[MTPAFActivity setTimeTracker:](v20, "setTimeTracker:", v23);

    }
    self = v20;
    v18 = self;
  }

  return v18;
}

- (void)addItemsFromPlaylist:(id)a3 pafKit:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  MTPAFItemActivity *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  MTPAFActivity *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "currentItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v10)
    goto LABEL_13;
  v11 = *(_QWORD *)v29;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v29 != v11)
        objc_enumerationMutation(obj);
      v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v12);
      v14 = objc_alloc_init(MTPAFItemActivity);
      -[MTPAFItemActivity setItem:](v14, "setItem:", v13);
      -[MTPAFItemActivity setPlaylist:](v14, "setPlaylist:", v6);
      v15 = -[MTPAFActivity activityType](self, "activityType");
      if (v15)
      {
        if (v15 != 1)
          goto LABEL_11;
        objc_msgSend(v7, "eventHandlers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "seekStart");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTPAFItemActivity setStartEventHandler:](v14, "setStartEventHandler:", v17);

        objc_msgSend(v7, "eventHandlers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "seekStop");
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v7, "eventHandlers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "playStart");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTPAFItemActivity setStartEventHandler:](v14, "setStartEventHandler:", v21);

        objc_msgSend(v7, "eventHandlers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "playStop");
        v19 = objc_claimAutoreleasedReturnValue();
      }
      v22 = (void *)v19;
      -[MTPAFItemActivity setStopEventHandler:](v14, "setStopEventHandler:", v19);

LABEL_11:
      objc_msgSend(v9, "addObject:", v14);

      ++v12;
    }
    while (v10 != v12);
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  }
  while (v10);
LABEL_13:

  v23 = self;
  objc_sync_enter(v23);
  -[MTPAFActivity itemActivities](v23, "itemActivities");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[MTPAFActivity itemActivities](v23, "itemActivities");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "arrayByAddingObjectsFromArray:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTPAFActivity setItemActivities:](v23, "setItemActivities:", v26);

  }
  else
  {
    v25 = (void *)objc_msgSend(v9, "copy");
    -[MTPAFActivity setItemActivities:](v23, "setItemActivities:", v25);
  }

  -[MTPAFActivity updateItemActivities:](v23, "updateItemActivities:", v9);
  objc_sync_exit(v23);

}

- (void)synchronizeAtMilliseconds:(unint64_t)a3
{
  void *v4;
  void *v5;
  MTPAFActivity *obj;

  obj = self;
  objc_sync_enter(obj);
  -[MTPAFActivity timeTracker](obj, "timeTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatePosition:", a3);

  -[MTPAFActivity setLastPosition:](obj, "setLastPosition:", a3);
  -[MTPAFActivity itemActivities](obj, "itemActivities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPAFActivity updateItemActivities:](obj, "updateItemActivities:", v5);

  objc_sync_exit(obj);
}

- (void)stoppedAtMilliseconds:(unint64_t)a3 triggerType:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v10;
  id v11;
  MTPAFActivity *v12;
  void *v13;
  id v14;

  v14 = a4;
  v10 = a5;
  v11 = a6;
  v12 = self;
  objc_sync_enter(v12);
  -[MTPAFActivity setStopped:](v12, "setStopped:", 1);
  -[MTPAFActivity setLastPosition:](v12, "setLastPosition:", a3);
  -[MTPAFActivity setStopTriggerType:](v12, "setStopTriggerType:", v14);
  -[MTPAFActivity setStopReason:](v12, "setStopReason:", v10);
  -[MTPAFActivity setStopEventData:](v12, "setStopEventData:", v11);
  -[MTPAFActivity itemActivities](v12, "itemActivities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPAFActivity updateItemActivities:](v12, "updateItemActivities:", v13);

  objc_sync_exit(v12);
}

- (void)startItemActivityIfPossible:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "startMetricsData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "item");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = -[__CFString start](v6, "start");
    if (v7 <= -[MTPAFActivity lastPosition](self, "lastPosition"))
    {
      objc_msgSend(v4, "item");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "end");
      v10 = -[MTPAFActivity startPosition](self, "startPosition");

      if (v9 <= v10)
        goto LABEL_10;
      objc_msgSend(v4, "item");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "start");
      v13 = -[MTPAFActivity startPosition](self, "startPosition");

      if (v12 <= v13)
      {
        -[MTPAFActivity startTriggerType](self, "startTriggerType");
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[MTPAFActivity startReason](self, "startReason");
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[MTPAFActivity startEventData](self, "startEventData");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = CFSTR("automatic");
        v14 = CFSTR("transition");
        -[MTPAFActivity timeTracker](self, "timeTracker");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "item");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "estimatedTimeAtPastPosition:", objc_msgSend(v16, "start"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "mt_millisecondsSince1970", CFSTR("eventTime"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v19;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v4, "startAtOverallPosition:triggerType:reason:eventData:", -[MTPAFActivity startPosition](self, "startPosition"), v6, v14, v20);

    }
    goto LABEL_10;
  }

LABEL_10:
}

- (void)stopItemActivityIfPossible:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _BOOL4 v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "startMetricsData");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (__CFString *)v5;
    objc_msgSend(v4, "stopMetricsData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

LABEL_11:
      goto LABEL_12;
    }
    objc_msgSend(v4, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "end");
    if (v9 < -[MTPAFActivity lastPosition](self, "lastPosition"))
    {

LABEL_7:
      objc_msgSend(v4, "item");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "end");
      v13 = -[MTPAFActivity lastPosition](self, "lastPosition");

      if (v12 >= v13)
      {
        -[MTPAFActivity stopTriggerType](self, "stopTriggerType");
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[MTPAFActivity stopReason](self, "stopReason");
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[MTPAFActivity stopEventData](self, "stopEventData");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = CFSTR("automatic");
        v14 = CFSTR("transition");
        -[MTPAFActivity timeTracker](self, "timeTracker");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "item");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "estimatedTimeAtPastPosition:", objc_msgSend(v16, "end"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "mt_millisecondsSince1970", CFSTR("eventTime"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v19;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v4, "stopAtOverallPosition:triggerType:reason:eventData:", -[MTPAFActivity lastPosition](self, "lastPosition"), v6, v14, v20);

      goto LABEL_11;
    }
    v10 = -[MTPAFActivity stopped](self, "stopped");

    if (v10)
      goto LABEL_7;
  }
LABEL_12:

}

- (void)updateItemActivities:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[MTPAFActivity startItemActivityIfPossible:](self, "startItemActivityIfPossible:", v9);
        -[MTPAFActivity stopItemActivityIfPossible:](self, "stopItemActivityIfPossible:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (int64_t)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(int64_t)a3
{
  self->_activityType = a3;
}

- (unint64_t)startPosition
{
  return self->_startPosition;
}

- (void)setStartPosition:(unint64_t)a3
{
  self->_startPosition = a3;
}

- (unint64_t)lastPosition
{
  return self->_lastPosition;
}

- (void)setLastPosition:(unint64_t)a3
{
  self->_lastPosition = a3;
}

- (BOOL)stopped
{
  return self->_stopped;
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (NSString)startTriggerType
{
  return self->_startTriggerType;
}

- (void)setStartTriggerType:(id)a3
{
  objc_storeStrong((id *)&self->_startTriggerType, a3);
}

- (NSString)startReason
{
  return self->_startReason;
}

- (void)setStartReason:(id)a3
{
  objc_storeStrong((id *)&self->_startReason, a3);
}

- (NSArray)startEventData
{
  return self->_startEventData;
}

- (void)setStartEventData:(id)a3
{
  objc_storeStrong((id *)&self->_startEventData, a3);
}

- (NSString)stopTriggerType
{
  return self->_stopTriggerType;
}

- (void)setStopTriggerType:(id)a3
{
  objc_storeStrong((id *)&self->_stopTriggerType, a3);
}

- (NSString)stopReason
{
  return self->_stopReason;
}

- (void)setStopReason:(id)a3
{
  objc_storeStrong((id *)&self->_stopReason, a3);
}

- (NSArray)stopEventData
{
  return self->_stopEventData;
}

- (void)setStopEventData:(id)a3
{
  objc_storeStrong((id *)&self->_stopEventData, a3);
}

- (NSArray)itemActivities
{
  return self->_itemActivities;
}

- (void)setItemActivities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (MTMediaTimeTracker)timeTracker
{
  return self->_timeTracker;
}

- (void)setTimeTracker:(id)a3
{
  objc_storeStrong((id *)&self->_timeTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeTracker, 0);
  objc_storeStrong((id *)&self->_itemActivities, 0);
  objc_storeStrong((id *)&self->_stopEventData, 0);
  objc_storeStrong((id *)&self->_stopReason, 0);
  objc_storeStrong((id *)&self->_stopTriggerType, 0);
  objc_storeStrong((id *)&self->_startEventData, 0);
  objc_storeStrong((id *)&self->_startReason, 0);
  objc_storeStrong((id *)&self->_startTriggerType, 0);
}

@end
