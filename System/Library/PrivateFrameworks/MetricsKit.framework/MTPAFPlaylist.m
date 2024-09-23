@implementation MTPAFPlaylist

- (MTPAFPlaylist)initWithSharedMetricsData:(id)a3
{
  id v4;
  MTPAFPlaylist *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTPAFPlaylist;
  v5 = -[MTPAFPlaylist init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "mt_deepCopy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTPAFPlaylist setMetricsData:](v5, "setMetricsData:", v6);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTPAFPlaylist setItems:](v5, "setItems:", v7);

  }
  return v5;
}

- (id)currentItems
{
  MTPAFPlaylist *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[MTPAFPlaylist items](v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  return v4;
}

- (void)addItemStartAtMilliseconds:(unint64_t)a3 endAtMilliseconds:(unint64_t)a4 metricsData:(id)a5
{
  MTPAFPlaylistItem *v8;
  MTPAFPlaylist *v9;
  void *v10;
  id v11;

  v11 = a5;
  v8 = -[MTPAFPlaylistItem initWithStart:end:metricsData:]([MTPAFPlaylistItem alloc], "initWithStart:end:metricsData:", a3, a4, v11);
  v9 = self;
  objc_sync_enter(v9);
  -[MTPAFPlaylist items](v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v8);

  objc_sync_exit(v9);
}

- (void)addItemStartAtMilliseconds:(unint64_t)a3 durationMilliseconds:(unint64_t)a4 metricsData:(id)a5
{
  -[MTPAFPlaylist addItemStartAtMilliseconds:endAtMilliseconds:metricsData:](self, "addItemStartAtMilliseconds:endAtMilliseconds:metricsData:", a3, a4 + a3, a5);
}

- (void)addItemStartAtSeconds:(double)a3 durationSeconds:(double)a4 metricsData:(id)a5
{
  -[MTPAFPlaylist addItemStartAtMilliseconds:endAtMilliseconds:metricsData:](self, "addItemStartAtMilliseconds:endAtMilliseconds:metricsData:", (unint64_t)(a3 * 1000.0), (unint64_t)((a3 + a4) * 1000.0), a5);
}

- (void)updateEventData:(id)a3
{
  MTPAFPlaylist *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MTPAFPlaylist metricsData](v4, "metricsData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MTPAFPlaylist metricsData](v4, "metricsData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTPAFPlaylist setMetricsData:](v4, "setMetricsData:", v7);

  }
  else
  {
    -[MTPAFPlaylist setMetricsData:](v4, "setMetricsData:", v8);
  }
  objc_sync_exit(v4);

}

- (NSArray)metricsData
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMetricsData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_metricsData, 0);
}

@end
