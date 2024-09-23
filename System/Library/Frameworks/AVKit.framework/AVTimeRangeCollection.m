@implementation AVTimeRangeCollection

- (AVTimeRangeCollection)initWithInterstitialTimeRanges:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  AVTimeRangeCollection *v13;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v11)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "timeRange");
          if ((v15 & 0x1D) == 1)
          {
            +[AVTimeRange timeRangeWithInterstice:](AVTimeRange, "timeRangeWithInterstice:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v12);

          }
        }
        else
        {
          v15 = 0;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v13 = -[AVTimeRangeCollection initWithTimeRanges:](self, "initWithTimeRanges:", v5);
  return v13;
}

- (AVTimeRangeCollection)initWithTimeRanges:(id)a3
{
  id v4;
  AVTimeRangeCollection *v5;
  uint64_t v6;
  NSArray *timeRanges;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AVTimeRangeCollection;
  v5 = -[AVTimeRangeCollection init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
    v6 = objc_claimAutoreleasedReturnValue();
    timeRanges = v5->_timeRanges;
    v5->_timeRanges = (NSArray *)v6;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v5->_timeRanges;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      v12 = 0.0;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v14, "duration", (_QWORD)v17);
          v12 = v12 + v15;
          objc_msgSend(v14, "endTime");
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }
    else
    {
      v12 = 0.0;
    }

    v5->_combinedDuration = v12;
  }

  return v5;
}

- (AVTimeRangeCollection)init
{
  return -[AVTimeRangeCollection initWithTimeRanges:](self, "initWithTimeRanges:", MEMORY[0x1E0C9AA60]);
}

- (AVTimeRangeCollection)initWithTimedMetadataGroups:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  AVTimeRange *v12;
  AVTimeRange *v13;
  AVTimeRangeCollection *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = [AVTimeRange alloc];
        v13 = -[AVTimeRange initWithAVTimedMetadataGroup:](v12, "initWithAVTimedMetadataGroup:", v11, (_QWORD)v16);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = -[AVTimeRangeCollection initWithTimeRanges:](self, "initWithTimeRanges:", v5);
  return v14;
}

- (void)setMapDate:(id)a3 toTime:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AVTimeRangeCollection timeRanges](self, "timeRanges", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setMapDate:toTime:", v6, a4);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (BOOL)isEqualToTimeRangeCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  -[AVTimeRangeCollection timeRanges](self, "timeRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v5, "count"))
    {
      v8 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "interstice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "interstice");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v10, "isEqual:", v12);
        if ((v13 & 1) == 0)
          break;
        ++v8;
      }
      while (v8 < objc_msgSend(v5, "count"));
    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  AVTimeRangeCollection *v4;
  BOOL v5;

  v4 = (AVTimeRangeCollection *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[AVTimeRangeCollection isEqualToTimeRangeCollection:](self, "isEqualToTimeRangeCollection:", v4);
  }

  return v5;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[AVTimeRangeCollection timeRanges](self, "timeRanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)timeRangeContainingTime:(double)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AVTimeRangeCollection timeRanges](self, "timeRanges", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "containsTime:", a3) & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)timeRangeClosestToTime:(double)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[AVTimeRangeCollection timeRanges](self, "timeRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AVTimeRangeCollection timeRanges](self, "timeRanges", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v12, "containsTime:", a3) & 1) != 0)
        {
          v17 = v12;

          goto LABEL_13;
        }
        objc_msgSend(v6, "deltaTimeFromOutsideTime:", a3);
        v14 = fabs(v13);
        objc_msgSend(v12, "deltaTimeFromOutsideTime:", a3);
        if (v14 > fabs(v15))
        {
          v16 = v12;

          v6 = v16;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }

  v6 = v6;
  v17 = v6;
LABEL_13:

  return v17;
}

- (id)timeRangeBeforeTime:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AVTimeRangeCollection timeRanges](self, "timeRanges", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "endTime");
        if (v11 < a3)
        {
          if (!v7 || (objc_msgSend(v10, "endTime"), v13 = v12, objc_msgSend(v7, "endTime"), v13 > v14))
          {
            v15 = v10;

            v7 = v15;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)timeRangeAfterTime:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AVTimeRangeCollection timeRanges](self, "timeRanges", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "startTime");
        if (v11 > a3)
        {
          if (!v7 || (objc_msgSend(v10, "startTime"), v13 = v12, objc_msgSend(v7, "startTime"), v13 < v14))
          {
            v15 = v10;

            v7 = v15;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)arrayOfBoundaryTimes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[3];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[AVTimeRangeCollection timeRanges](self, "timeRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E0CB3B18];
        if (v9)
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "startCMTime");
        else
          memset(v18, 0, sizeof(v18));
        objc_msgSend(v10, "valueWithCMTime:", v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        objc_msgSend(v9, "duration");
        if (v12 > 0.0)
        {
          v13 = (void *)MEMORY[0x1E0CB3B18];
          if (v9)
            objc_msgSend(v9, "endCMTime");
          else
            memset(v17, 0, sizeof(v17));
          objc_msgSend(v13, "valueWithCMTime:", v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v14);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v15 = (void *)objc_msgSend(v3, "copy");
  return v15;
}

- (id)arrayOfDisplayTimesMatching:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  AVTimeRangeCollection *v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTimeRangeCollection timeRanges](self, "timeRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__AVTimeRangeCollection_arrayOfDisplayTimesMatching___block_invoke;
  v11[3] = &unk_1E5BB4830;
  v13 = self;
  v14 = v4;
  v12 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 0, v11);

  v9 = (void *)objc_msgSend(v7, "copy");
  return v9;
}

- (id)arrayOfDisplayTimes
{
  return -[AVTimeRangeCollection arrayOfDisplayTimesMatching:](self, "arrayOfDisplayTimesMatching:", &__block_literal_global_91);
}

- (id)timeRangesBetweenDisplayTime:(double)a3 and:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[AVTimeRangeCollection timeFromDisplayTime:](self, "timeFromDisplayTime:", a3);
  v7 = v6;
  -[AVTimeRangeCollection timeFromDisplayTime:](self, "timeFromDisplayTime:", a4);
  v9 = v8;
  if (v7 >= v8)
    v10 = v8;
  else
    v10 = v7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[AVTimeRangeCollection timeRanges](self, "timeRanges", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = v7 + v9 - v10;
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v18, "startTime");
        if (v19 < v15)
        {
          objc_msgSend(v18, "endTime");
          if (v20 > v10)
            objc_msgSend(v11, "addObject:", v18);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v11, "count"))
    v21 = (void *)objc_msgSend(v11, "copy");
  else
    v21 = 0;

  return v21;
}

- (double)displayTimeFromTime:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AVTimeRangeCollection timeRanges](self, "timeRanges", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = 0.0;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v10, "containsTime:", a3))
        {
          if (objc_msgSend(v10, "isCollapsedInTimeLine"))
          {
            objc_msgSend(v10, "startTime");
            v14 = v15 - v8;
          }
          else
          {
LABEL_18:
            v14 = a3 - v8;
          }
LABEL_20:

          return v14;
        }
        objc_msgSend(v10, "startTime");
        if (v11 > a3)
          goto LABEL_18;
        if (objc_msgSend(v10, "isCollapsedInTimeLine"))
        {
          objc_msgSend(v10, "duration");
          v8 = v8 + v12;
        }
        objc_msgSend(v10, "endTime");
        if (v13 == a3)
        {
          v14 = a3 - v8 + 0.00000011920929;
          goto LABEL_20;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0.0;
  }

  return a3 - v8;
}

- (double)timeFromDisplayTime:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AVTimeRangeCollection timeRanges](self, "timeRanges", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
      objc_msgSend(v9, "startTime");
      if (a3 <= v10)
        break;
      if (objc_msgSend(v9, "isCollapsedInTimeLine"))
      {
        objc_msgSend(v9, "duration");
        a3 = a3 + v11;
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  return a3;
}

- (id)displayTimeRangeTrimmedToTimeRange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  AVTimeRange *v9;
  double v10;
  double v11;
  double v12;
  AVTimeRange *v13;

  v4 = a3;
  objc_msgSend(v4, "startTime");
  -[AVTimeRangeCollection timeRangeContainingTime:](self, "timeRangeContainingTime:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "timeRangeExcludingTimeRange:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;
  objc_msgSend(v6, "duration");
  if (v8 == 0.0)
  {
    +[AVTimeRange timeRangeZero](AVTimeRange, "timeRangeZero");
    v9 = (AVTimeRange *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "startTime");
    -[AVTimeRangeCollection displayTimeFromTime:](self, "displayTimeFromTime:");
    v11 = v10;
    objc_msgSend(v7, "endTime");
    -[AVTimeRangeCollection displayTimeFromTime:](self, "displayTimeFromTime:");
    v9 = -[AVTimeRange initWithStartTime:endTime:]([AVTimeRange alloc], "initWithStartTime:endTime:", v11, v12);
  }
  v13 = v9;

  return v13;
}

- (id)description
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  NSUInteger v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_timeRanges;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "description");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = (const __CFString *)v9;
        else
          v11 = CFSTR("??");
        objc_msgSend(v3, "addObject:", v11);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[NSArray count](self->_timeRanges, "count");
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@ %p>: %d ranges [%@]"), v14, self, v15, v16, (_QWORD)v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSArray)timeRanges
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (double)combinedDuration
{
  return self->_combinedDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRanges, 0);
}

uint64_t __44__AVTimeRangeCollection_arrayOfDisplayTimes__block_invoke()
{
  return 1;
}

void __53__AVTimeRangeCollection_arrayOfDisplayTimesMatching___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((*(unsigned int (**)(void))(a1[6] + 16))())
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v5 = (void *)a1[4];
    v4 = (void *)a1[5];
    objc_msgSend(v7, "startTime");
    objc_msgSend(v4, "displayTimeFromTime:");
    objc_msgSend(v3, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

@end
