@implementation MTHLSVideoPlaylist

- (MTHLSVideoPlaylist)initWithStartPosition:(unint64_t)a3 mainFeatureMetricsData:(id)a4
{
  id v6;
  MTHLSVideoPlaylist *v7;
  MTHLSVideoPlaylist *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MTHLSVideoPlaylist;
  v7 = -[MTHLSVideoPlaylist init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[MTHLSVideoPlaylist setStartPosition:](v7, "setStartPosition:", a3);
    -[MTHLSVideoPlaylist setMainFeatureMetricsData:](v8, "setMainFeatureMetricsData:", v6);
  }

  return v8;
}

- (MTHLSVideoPlaylist)initWithMainFeatureMetricsData:(id)a3
{
  return -[MTHLSVideoPlaylist initWithStartPosition:mainFeatureMetricsData:](self, "initWithStartPosition:mainFeatureMetricsData:", 0, a3);
}

- (void)addRollInfoItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[MTHLSVideoPlaylist addRollInfoItem:](self, "addRollInfoItem:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)addRollInfoItem:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "metricsData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v8, "start");
  v6 = v5;
  objc_msgSend(v8, "duration");
  -[MTHLSVideoPlaylist addItemStartAtSeconds:durationSeconds:metricsData:](self, "addItemStartAtSeconds:durationSeconds:metricsData:", v4, v6, v7);

}

- (void)addItemStartAtSeconds:(double)a3 durationSeconds:(double)a4 metricsData:(id)a5
{
  id v8;
  MTHLSRollItem *v9;

  v8 = a5;
  v9 = -[MTHLSRollItem initWithStartOverallPosition:duration:metricsData:]([MTHLSRollItem alloc], "initWithStartOverallPosition:duration:metricsData:", (unint64_t)(a3 * 1000.0), (unint64_t)(a4 * 1000.0), v8);

  -[MTHLSVideoPlaylist addRollItem:](self, "addRollItem:", v9);
}

- (void)addItemStartAtMilliseconds:(unint64_t)a3 durationMilliseconds:(unint64_t)a4 metricsData:(id)a5
{
  id v8;
  MTHLSRollItem *v9;

  v8 = a5;
  v9 = -[MTHLSRollItem initWithStartOverallPosition:duration:metricsData:]([MTHLSRollItem alloc], "initWithStartOverallPosition:duration:metricsData:", a3, a4, v8);

  -[MTHLSVideoPlaylist addRollItem:](self, "addRollItem:", v9);
}

- (void)addItemStartAtMilliseconds:(unint64_t)a3 endAtMilliseconds:(unint64_t)a4 metricsData:(id)a5
{
  -[MTHLSVideoPlaylist addItemStartAtMilliseconds:durationMilliseconds:metricsData:](self, "addItemStartAtMilliseconds:durationMilliseconds:metricsData:", a3, a4 - a3, a5);
}

- (id)itemAtOverallPosition:(unint64_t)a3 rangeOptions:(int64_t)a4
{
  char v4;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  void *v15;
  void *v16;
  id v17;

  v4 = a4;
  v7 = -[MTHLSVideoPlaylist indexOfLastRollItemWithStartBeforePosition:](self, "indexOfLastRollItemWithStartBeforePosition:");
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[MTHLSVideoPlaylist mainFeatureItemWithStartOverallPosition:](self, "mainFeatureItemWithStartOverallPosition:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
    if ((v4 & 1) == 0)
    {
      do
      {
        -[MTHLSVideoPlaylist rollItems](self, "rollItems");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "startOverallPosition");

        v13 = v9 - 1;
        if (v12 != a3)
          break;
      }
      while (v9-- > 0);
      v9 = v13 + 1;
    }
    -[MTHLSVideoPlaylist rollItems](self, "rollItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v16, "containsOverallPosition:", a3) & 1) != 0
      || (v4 & 2) != 0 && objc_msgSend(v16, "endOverallPosition") == a3)
    {
      v17 = v16;
    }
    else
    {
      -[MTHLSVideoPlaylist mainFeatureItemWithStartOverallPosition:](self, "mainFeatureItemWithStartOverallPosition:", objc_msgSend(v16, "endOverallPosition"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v17;

  }
  return v8;
}

- (id)itemsBetweenStartOverallPosition:(unint64_t)a3 endOverallPosition:(unint64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTHLSVideoPlaylist rollItems](self, "rollItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = -[MTHLSVideoPlaylist indexOfLastRollItemWithStartBeforePosition:](self, "indexOfLastRollItemWithStartBeforePosition:", a3);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[MTHLSVideoPlaylist mainFeatureItemWithStartOverallPosition:](self, "mainFeatureItemWithStartOverallPosition:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

      v10 = 0;
    }
    while (1)
    {
      -[MTHLSVideoPlaylist rollItems](self, "rollItems");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v10 >= v21)
        break;
      -[MTHLSVideoPlaylist rollItems](self, "rollItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "startOverallPosition") > a4)
        goto LABEL_17;
      if (objc_msgSend(v13, "endOverallPosition") >= a3)
        objc_msgSend(v7, "addObject:", v13);
      ++v10;
      if (objc_msgSend(v13, "endOverallPosition") < a4)
      {
        -[MTHLSVideoPlaylist rollItems](self, "rollItems");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v10 >= v15)
        {
          -[MTHLSVideoPlaylist mainFeatureItemWithStartOverallPosition:](self, "mainFeatureItemWithStartOverallPosition:", objc_msgSend(v13, "endOverallPosition"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v17);
        }
        else
        {
          -[MTHLSVideoPlaylist rollItems](self, "rollItems");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = objc_msgSend(v17, "startOverallPosition");
          if (v18 > objc_msgSend(v13, "endOverallPosition"))
          {
            -[MTHLSVideoPlaylist mainFeatureItemWithStartOverallPosition:](self, "mainFeatureItemWithStartOverallPosition:", objc_msgSend(v13, "endOverallPosition"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v19);

          }
        }

      }
    }
  }
  else
  {
    -[MTHLSVideoPlaylist mainFeatureItemWithStartOverallPosition:](self, "mainFeatureItemWithStartOverallPosition:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v13);
LABEL_17:

  }
  return v7;
}

- (NSMutableArray)rollItems
{
  NSMutableArray *rollItems;
  NSMutableArray *v4;
  NSMutableArray *v5;

  rollItems = self->_rollItems;
  if (!rollItems)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_rollItems;
    self->_rollItems = v4;

    rollItems = self->_rollItems;
  }
  return rollItems;
}

- (void)addRollItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[MTHLSVideoPlaylist rollItems](self, "rollItems");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "count");
  +[MTHLSItem comparator](MTHLSItem, "comparator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, v5, 1024, v6);

  objc_msgSend(v8, "insertObject:atIndex:", v4, v7);
}

- (id)mainFeatureItemWithStartOverallPosition:(unint64_t)a3
{
  MTHLSItem *v5;
  void *v6;
  MTHLSItem *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v5 = [MTHLSItem alloc];
  -[MTHLSVideoPlaylist mainFeatureMetricsData](self, "mainFeatureMetricsData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MTHLSItem initWithStartOverallPosition:metricsData:](v5, "initWithStartOverallPosition:metricsData:", a3, v6);

  v8 = -[MTHLSVideoPlaylist startPosition](self, "startPosition");
  v9 = -[MTHLSVideoPlaylist indexOfLastRollItemWithStartBeforePosition:](self, "indexOfLastRollItemWithStartBeforePosition:", a3);
  if (v9 <= 0x7FFFFFFFFFFFFFFELL)
  {
    v10 = v9;
    -[MTHLSVideoPlaylist rollItems](self, "rollItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v13 = v10 - 1;
      do
      {
        -[MTHLSVideoPlaylist rollItems](self, "rollItems");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_msgSend(v12, "startOverallPosition");
        v17 = objc_msgSend(v15, "startOverallPosition");
        v18 = objc_msgSend(v15, "duration");

        v8 = v16 + v8 - (v17 + v18);
        -[MTHLSVideoPlaylist rollItems](self, "rollItems");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        --v13;
      }
      while (v13 != -1);
    }
    v8 += objc_msgSend(v12, "startOverallPosition");

  }
  -[MTHLSItem setStartPosition:](v7, "setStartPosition:", v8);
  return v7;
}

- (int64_t)indexOfLastRollItemWithStartBeforePosition:(unint64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  -[MTHLSVideoPlaylist rollItems](self, "rollItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "startOverallPosition") <= a3)
  {
    -[MTHLSVideoPlaylist rollItems](self, "rollItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") - 1;

    if (v9 < 1)
    {
      v7 = 0;
    }
    else
    {
      v7 = 0;
      do
      {
        if (v7 + v9 + 1 >= 0)
          v10 = v7 + v9 + 1;
        else
          v10 = v7 + v9 + 2;
        v11 = v10 >> 1;
        -[MTHLSVideoPlaylist rollItems](self, "rollItems");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "startOverallPosition") > a3)
          v9 = v11 - 1;
        else
          v7 = v11;

      }
      while (v7 < v9);
    }
  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (unint64_t)startPosition
{
  return self->_startPosition;
}

- (void)setStartPosition:(unint64_t)a3
{
  self->_startPosition = a3;
}

- (void)setRollItems:(id)a3
{
  objc_storeStrong((id *)&self->_rollItems, a3);
}

- (NSArray)mainFeatureMetricsData
{
  return self->_mainFeatureMetricsData;
}

- (void)setMainFeatureMetricsData:(id)a3
{
  objc_storeStrong((id *)&self->_mainFeatureMetricsData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainFeatureMetricsData, 0);
  objc_storeStrong((id *)&self->_rollItems, 0);
}

@end
