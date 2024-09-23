@implementation PKSelectionStatisticsSession

- (PKSelectionStatisticsSession)init
{
  PKSelectionStatisticsSession *v2;
  uint64_t v3;
  NSDate *startTime;
  uint64_t v5;
  NSMutableArray *selectionActions;
  uint64_t v7;
  NSMutableArray *selectionGestures;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKSelectionStatisticsSession;
  v2 = -[PKSelectionStatisticsSession init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    startTime = v2->_startTime;
    v2->_startTime = (NSDate *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    selectionActions = v2->_selectionActions;
    v2->_selectionActions = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    selectionGestures = v2->_selectionGestures;
    v2->_selectionGestures = (NSMutableArray *)v7;

  }
  return v2;
}

- (void)logGesture:(int64_t)a3 selectionType:(int64_t)a4 contentType:(int64_t)a5
{
  const __CFString *v5;

  ++self->_selectionGestureCount;
  self->_lastSelectionType = a4;
  self->_lastContentType = a5;
  if ((unint64_t)(a3 - 1) > 5)
    v5 = CFSTR("none");
  else
    v5 = off_1E777D680[a3 - 1];
  -[NSMutableArray addObject:](self->_selectionGestures, "addObject:", v5);
}

- (void)logSelectionAction:(int64_t)a3
{
  const __CFString *v3;

  if ((unint64_t)(a3 - 1) > 8)
    v3 = CFSTR("selectionActionTypeNone");
  else
    v3 = off_1E777D638[a3 - 1];
  -[NSMutableArray addObject:](self->_selectionActions, "addObject:", v3);
}

- (double)timeSpentSelecting
{
  double v2;

  -[NSDate timeIntervalSinceNow](self->_startTime, "timeIntervalSinceNow");
  return -v2;
}

- (NSDictionary)selectionGestureDictionary
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_selectionGestures;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "valueForKey:", v9, (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v3, "valueForKey:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (int)objc_msgSend(v11, "intValue");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12 + 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v13, v9);

        }
        else
        {
          objc_msgSend(v3, "setObject:forKey:", &unk_1E77EBFD0, v9);
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (NSDictionary)selectionActionDictionary
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_selectionActions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "valueForKey:", v9, (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v3, "valueForKey:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (int)objc_msgSend(v11, "intValue");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12 + 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v13, v9);

        }
        else
        {
          objc_msgSend(v3, "setObject:forKey:", &unk_1E77EBFD0, v9);
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (int64_t)numberOfTimesSelectionWasClearedInASession
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_selectionActions;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isEqual:", CFSTR("selectionActionTypeNone"), (_QWORD)v9);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)lastActionTaken
{
  __CFString *v3;

  if (-[NSMutableArray count](self->_selectionActions, "count"))
  {
    -[NSMutableArray lastObject](self->_selectionActions, "lastObject");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("selectionActionTypeNone");
  }
  return (NSString *)v3;
}

- (NSString)lastSignificantActionTaken
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  char v6;

  v3 = -[NSMutableArray count](self->_selectionActions, "count");
  v4 = CFSTR("selectionActionTypeNone");
  while (--v3 >= 0)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_selectionActions, "objectAtIndexedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", CFSTR("selectionActionTypeNone"));

    if ((v6 & 1) == 0)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_selectionActions, "objectAtIndexedSubscript:", v3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return (NSString *)v4;
    }
  }
  return (NSString *)v4;
}

- (void)setTimeSpentSelecting:(double)a3
{
  self->_timeSpentSelecting = a3;
}

- (void)setNumberOfTimesSelectionWasClearedInASession:(int64_t)a3
{
  self->_numberOfTimesSelectionWasClearedInASession = a3;
}

- (int64_t)selectionGestureCount
{
  return self->_selectionGestureCount;
}

- (void)setSelectionGestureCount:(int64_t)a3
{
  self->_selectionGestureCount = a3;
}

- (void)setLastActionTaken:(id)a3
{
  objc_storeStrong((id *)&self->_lastActionTaken, a3);
}

- (void)setLastSignificantActionTaken:(id)a3
{
  objc_storeStrong((id *)&self->_lastSignificantActionTaken, a3);
}

- (int64_t)lastSelectionType
{
  return self->_lastSelectionType;
}

- (void)setLastSelectionType:(int64_t)a3
{
  self->_lastSelectionType = a3;
}

- (int64_t)lastContentType
{
  return self->_lastContentType;
}

- (void)setLastContentType:(int64_t)a3
{
  self->_lastContentType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSignificantActionTaken, 0);
  objc_storeStrong((id *)&self->_lastActionTaken, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_selectionActions, 0);
  objc_storeStrong((id *)&self->_selectionGestures, 0);
}

@end
