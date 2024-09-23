@implementation PKSelectionStatisticsManager

void __55__PKSelectionStatisticsManager_sharedStatisticsManager__block_invoke()
{
  PKSelectionStatisticsManager *v0;
  void *v1;

  v0 = objc_alloc_init(PKSelectionStatisticsManager);
  v1 = (void *)qword_1ECEE65B0;
  qword_1ECEE65B0 = (uint64_t)v0;

}

- (void)logScrollEventWithContentOffset:(CGPoint)a3
{
  double x;
  double y;
  PKSelectionStatisticsSession *selectionSession;
  void *v7;
  int v8;

  x = self->_lastContentOffset.x;
  y = self->_lastContentOffset.y;
  self->_lastContentOffset = a3;
  selectionSession = self->_selectionSession;
  if (selectionSession && sqrt((a3.y - y) * (a3.y - y) + (a3.x - x) * (a3.x - x)) > 1000.0)
  {
    -[PKSelectionStatisticsSession lastActionTaken](selectionSession, "lastActionTaken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("selectionActionTypeNone"));

    if (v8)
      -[PKSelectionStatisticsManager _endSelectionSession](self, "_endSelectionSession");
  }
}

+ (id)sharedStatisticsManager
{
  if (_MergedGlobals_156 != -1)
    dispatch_once(&_MergedGlobals_156, &__block_literal_global_86);
  return (id)qword_1ECEE65B0;
}

- (void)recordDidMakeSelectionWithType:(int64_t)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;

  v3 = CFSTR("smartSelection");
  if (!a3)
    v3 = CFSTR("lasso");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("selection.selectionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v6 = v4;
  AnalyticsSendEventLazy();

}

id __63__PKSelectionStatisticsManager_recordDidMakeSelectionWithType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("selectionType");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordLassoSelectionEventWithContentType:(int64_t)a3
{
  PKSelectionStatisticsSession *v5;
  PKSelectionStatisticsSession *selectionSession;
  __CFString *v7;
  void *v8;

  if (self->_selectionSession)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__endSelectionSession, 0);
  }
  else
  {
    v5 = objc_alloc_init(PKSelectionStatisticsSession);
    selectionSession = self->_selectionSession;
    self->_selectionSession = v5;

  }
  -[PKSelectionStatisticsSession logGesture:selectionType:contentType:](self->_selectionSession, "logGesture:selectionType:contentType:", 6, 0, a3);
  -[PKSelectionStatisticsManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__endSelectionSession, 0, 180.0);
  if ((unint64_t)(a3 - 1) > 5)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E777D6E0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("selection.lassoSelection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

}

id __73__PKSelectionStatisticsManager_recordLassoSelectionEventWithContentType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("lassoSelectionContents");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)recordSmartSelectionEventWithType:(int64_t)a3 contentType:(int64_t)a4 gestureInvoked:(int64_t)a5
{
  PKSelectionStatisticsSession *v9;
  PKSelectionStatisticsSession *selectionSession;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;

  if (self->_selectionSession)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__endSelectionSession, 0);
  }
  else
  {
    v9 = objc_alloc_init(PKSelectionStatisticsSession);
    selectionSession = self->_selectionSession;
    self->_selectionSession = v9;

  }
  -[PKSelectionStatisticsSession logGesture:selectionType:contentType:](self->_selectionSession, "logGesture:selectionType:contentType:", a5, a3, a4);
  -[PKSelectionStatisticsManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__endSelectionSession, 0, 180.0);
  if ((unint64_t)(a3 - 1) > 5)
    v11 = CFSTR("lasso");
  else
    v11 = off_1E777D6B0[a3 - 1];
  if ((unint64_t)(a4 - 1) > 5)
    v12 = CFSTR("unknown");
  else
    v12 = off_1E777D6E0[a4 - 1];
  if ((unint64_t)(a5 - 1) > 5)
    v13 = CFSTR("none");
  else
    v13 = off_1E777D680[a5 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("selection.smartSelection"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

}

id __93__PKSelectionStatisticsManager_recordSmartSelectionEventWithType_contentType_gestureInvoked___block_invoke(uint64_t a1)
{
  __int128 v1;
  _QWORD v3[3];
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = *(_OWORD *)(a1 + 32);
  v3[0] = CFSTR("smartSelectionLevel");
  v3[1] = CFSTR("smartSelectionContents");
  v4 = v1;
  v3[2] = CFSTR("gestureInvoked");
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)logSelectionAction:(int64_t)a3
{
  PKSelectionStatisticsSession *v5;
  PKSelectionStatisticsSession *selectionSession;

  if (self->_selectionSession)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__endSelectionSession, 0);
    -[PKSelectionStatisticsSession logSelectionAction:](self->_selectionSession, "logSelectionAction:", a3);
  }
  else
  {
    v5 = objc_alloc_init(PKSelectionStatisticsSession);
    selectionSession = self->_selectionSession;
    self->_selectionSession = v5;

    -[PKSelectionStatisticsSession logSelectionAction:](self->_selectionSession, "logSelectionAction:", a3);
    -[PKSelectionStatisticsManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__endSelectionSession, 0, 180.0);
  }
}

- (void)logEndSelectionSessionIfNecessary
{
  if (self->_selectionSession)
    -[PKSelectionStatisticsManager _endSelectionSession](self, "_endSelectionSession");
}

- (void)_endSelectionSession
{
  PKSelectionStatisticsSession *selectionSession;

  if (self->_selectionSession)
  {
    -[PKSelectionStatisticsManager _recordSelectionSession:](self, "_recordSelectionSession:");
    selectionSession = self->_selectionSession;
    self->_selectionSession = 0;

  }
}

- (void)_recordSelectionSession:(id)a3
{
  id v3;
  unint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[7];
  _QWORD v21[8];

  v21[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "lastSelectionType") - 1;
  if (v4 > 5)
    v5 = CFSTR("lasso");
  else
    v5 = off_1E777D6B0[v4];
  v6 = objc_msgSend(v3, "lastContentType");
  if ((unint64_t)(v6 - 1) > 5)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E777D6E0[v6 - 1];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = &unk_1E77EBFD0;
  v20[0] = CFSTR("sessionCount");
  v20[1] = CFSTR("timeSpentEditingSelection");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "timeSpentSelecting");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  v21[2] = v5;
  v20[2] = CFSTR("selectionType");
  v20[3] = CFSTR("selectionContents");
  v21[3] = v7;
  v20[4] = CFSTR("selectionEditCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "selectionGestureCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v11;
  v20[5] = CFSTR("selectionActionType");
  objc_msgSend(v3, "lastSignificantActionTaken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v12;
  v20[6] = CFSTR("deselected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "numberOfTimesSelectionWasClearedInASession"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addEntriesFromDictionary:", v14);
  objc_msgSend(v3, "selectionGestureDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v15);

  objc_msgSend(v3, "selectionActionDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v16);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("selection.session"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v8;
  v18 = v8;
  AnalyticsSendEventLazy();

}

id __56__PKSelectionStatisticsManager__recordSelectionSession___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionSession, 0);
}

@end
