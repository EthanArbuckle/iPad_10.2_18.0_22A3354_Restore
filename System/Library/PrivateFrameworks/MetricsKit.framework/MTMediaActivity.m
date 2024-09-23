@implementation MTMediaActivity

- (MTMediaActivity)initWithType:(int64_t)a3 playlistItem:(id)a4 pafKit:(id)a5
{
  id v8;
  id v9;
  MTMediaActivity *v10;
  MTMediaActivity *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MTMediaActivity;
  v10 = -[MTMediaActivity init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[MTMediaActivity setPafKit:](v10, "setPafKit:", v9);
    -[MTMediaActivity setType:](v11, "setType:", a3);
    -[MTMediaActivity setPlaylistItem:](v11, "setPlaylistItem:", v8);
  }

  return v11;
}

- (unint64_t)positionFromOverallPosition:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  int v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[MTMediaActivity playlistItem](self, "playlistItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[MTMediaActivity startOverallPositionForItem:](MTMediaActivity, "startOverallPositionForItem:", v5);

  v7 = a3 - v6;
  if (a3 < v6)
  {
    MTMetricsKitOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = 134218240;
      v15 = a3;
      v16 = 2048;
      v17 = v6;
      _os_log_impl(&dword_20D758000, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Media Activity is recorded with incorrect overallPosition: %ld playlist item startOverallPosition: %ld", (uint8_t *)&v14, 0x16u);
    }

  }
  -[MTMediaActivity playlistItem](self, "playlistItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[MTMediaActivity playlistItem](self, "playlistItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "startPosition");

  }
  else
  {
    v12 = 0;
  }
  return v7 + v12;
}

- (void)startedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[MTMediaActivity startEventHandler](self, "startEventHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "metricsDataForStartActionWithPosition:overallPosition:type:reason:eventData:", -[MTMediaActivity positionFromOverallPosition:](self, "positionFromOverallPosition:", a3), a3, v12, v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTMediaActivity setStartMetricsData:](self, "setStartMetricsData:", v14);
  if (-[MTMediaActivity type](self, "type") != 1)
  {
    -[MTMediaActivity startMetricsData](self, "startMetricsData");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v16, "recordEvent");

  }
}

- (void)stoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[MTMediaActivity stopEventHandler](self, "stopEventHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MTMediaActivity positionFromOverallPosition:](self, "positionFromOverallPosition:", a3);
  -[MTMediaActivity startMetricsData](self, "startMetricsData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "metricsDataForStopActionWithPosition:overallPosition:type:reason:startMetricsData:eventData:", v14, a3, v12, v11, v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTMediaActivity setStopMetricsData:](self, "setStopMetricsData:", v16);
  -[MTMediaActivity stopMetricsData](self, "stopMetricsData");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v18, "recordEvent");

}

- (BOOL)isStopped
{
  void *v2;
  BOOL v3;

  -[MTMediaActivity stopMetricsData](self, "stopMetricsData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)eventDataForTransitioningEvents
{
  void *v2;
  void *v3;

  -[MTMediaActivity startMetricsData](self, "startMetricsData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userAndClientIDFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)startEventHandler
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v3 = -[MTMediaActivity type](self, "type");
  if (v3 == 1)
  {
    -[MTMediaActivity pafKit](self, "pafKit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventHandlers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "seekStart");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3)
    {
      v8 = -[MTMediaActivity type](self, "type");
      v15 = MTConfigurationError(109, CFSTR("No start event handler found for media activity type: %d"), v9, v10, v11, v12, v13, v14, v8);
      v7 = 0;
      return v7;
    }
    -[MTMediaActivity pafKit](self, "pafKit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventHandlers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playStart");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)stopEventHandler
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v3 = -[MTMediaActivity type](self, "type");
  if (v3 == 1)
  {
    -[MTMediaActivity pafKit](self, "pafKit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventHandlers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "seekStop");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3)
    {
      v8 = -[MTMediaActivity type](self, "type");
      v15 = MTConfigurationError(109, CFSTR("No stop event handler found for media activity type: %d"), v9, v10, v11, v12, v13, v14, v8);
      v7 = 0;
      return v7;
    }
    -[MTMediaActivity pafKit](self, "pafKit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventHandlers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playStop");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

+ (unint64_t)startOverallPositionForItem:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "startOverallPosition");
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = objc_msgSend(v3, "overallPosition");
  }
  v5 = v4;
LABEL_7:

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (MTMediaPlaylistItem)playlistItem
{
  return self->_playlistItem;
}

- (void)setPlaylistItem:(id)a3
{
  objc_storeStrong((id *)&self->_playlistItem, a3);
}

- (MTMetricsData)startMetricsData
{
  return self->_startMetricsData;
}

- (void)setStartMetricsData:(id)a3
{
  objc_storeStrong((id *)&self->_startMetricsData, a3);
}

- (MTMetricsData)stopMetricsData
{
  return self->_stopMetricsData;
}

- (void)setStopMetricsData:(id)a3
{
  objc_storeStrong((id *)&self->_stopMetricsData, a3);
}

- (MTPAFKit)pafKit
{
  return (MTPAFKit *)objc_loadWeakRetained((id *)&self->_pafKit);
}

- (void)setPafKit:(id)a3
{
  objc_storeWeak((id *)&self->_pafKit, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pafKit);
  objc_storeStrong((id *)&self->_stopMetricsData, 0);
  objc_storeStrong((id *)&self->_startMetricsData, 0);
  objc_storeStrong((id *)&self->_playlistItem, 0);
}

@end
