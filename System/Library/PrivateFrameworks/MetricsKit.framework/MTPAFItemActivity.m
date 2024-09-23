@implementation MTPAFItemActivity

- (void)startAtOverallPosition:(unint64_t)a3 triggerType:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v21 = a6;
  v10 = a5;
  v11 = a4;
  -[MTPAFItemActivity item](self, "item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "start");

  if (v13 > a3)
  {
    -[MTPAFItemActivity item](self, "item");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v14, "start");

  }
  -[MTPAFItemActivity item](self, "item");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "start");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPAFItemActivity populatePlaylistAndItemData:](self, "populatePlaylistAndItemData:", v17);
  if (v21)
    objc_msgSend(v17, "addObjectsFromArray:", v21);
  -[MTPAFItemActivity startEventHandler](self, "startEventHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "metricsDataForStartActionWithPosition:overallPosition:type:reason:eventData:", a3 - v16, a3, v11, v10, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (id)objc_msgSend(v19, "recordEvent");
  -[MTPAFItemActivity setStartMetricsData:](self, "setStartMetricsData:", v19);

}

- (void)stopAtOverallPosition:(unint64_t)a3 triggerType:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v22 = a6;
  v10 = a5;
  v11 = a4;
  -[MTPAFItemActivity item](self, "item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "end");

  if (v13 < a3)
  {
    -[MTPAFItemActivity item](self, "item");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v14, "end");

  }
  -[MTPAFItemActivity item](self, "item");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "start");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPAFItemActivity populatePlaylistAndItemData:](self, "populatePlaylistAndItemData:", v17);
  if (v22)
    objc_msgSend(v17, "addObjectsFromArray:", v22);
  -[MTPAFItemActivity stopEventHandler](self, "stopEventHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPAFItemActivity startMetricsData](self, "startMetricsData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "metricsDataForStopActionWithPosition:overallPosition:type:reason:startMetricsData:eventData:", a3 - v16, a3, v11, v10, v19, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (id)objc_msgSend(v20, "recordEvent");
  -[MTPAFItemActivity setStopMetricsData:](self, "setStopMetricsData:", v20);

}

- (void)populatePlaylistAndItemData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MTPAFItemActivity playlist](self, "playlist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metricsData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v8, "addObjectsFromArray:", v5);
  -[MTPAFItemActivity item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metricsData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v8, "addObjectsFromArray:", v7);

}

- (MTPAFPlaylistItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (MTPAFPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_playlist, a3);
}

- (MTMediaActivityEventHandler)startEventHandler
{
  return self->_startEventHandler;
}

- (void)setStartEventHandler:(id)a3
{
  objc_storeStrong((id *)&self->_startEventHandler, a3);
}

- (MTMediaActivityEventHandler)stopEventHandler
{
  return self->_stopEventHandler;
}

- (void)setStopEventHandler:(id)a3
{
  objc_storeStrong((id *)&self->_stopEventHandler, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopMetricsData, 0);
  objc_storeStrong((id *)&self->_startMetricsData, 0);
  objc_storeStrong((id *)&self->_stopEventHandler, 0);
  objc_storeStrong((id *)&self->_startEventHandler, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
