@implementation EKDayViewContentItem

- (BOOL)hideTravelTime
{
  return 0;
}

- (void)setIsLoadingAsync:(BOOL)a3
{
  self->_isLoadingAsync = a3;
}

- (CGRect)stagedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_stagedFrame.origin.x;
  y = self->_stagedFrame.origin.y;
  width = self->_stagedFrame.size.width;
  height = self->_stagedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)visibleHeight
{
  return self->_visibleHeight;
}

- (double)enoughHeightForOneLine
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  int v7;

  -[EKDayViewContentItem events](self, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKDayOccurrenceView enoughHeightForOneLineForEvents:usingSmallText:sizeClass:](EKDayOccurrenceView, "enoughHeightForOneLineForEvents:usingSmallText:sizeClass:", v3, -[EKDayViewContentItem usesSmallText](self, "usesSmallText"), self->_sizeClass);
  v5 = v4;

  -[EKDayViewContentItem currentState](self, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "reminderStackDepth");

  return v5 + (double)(v7 - 1) * 2.0;
}

- (double)viewMaxNaturalTextHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  if (-[EKDayViewContentItem isLoadingAsync](self, "isLoadingAsync")
    || (-[EKDayViewContentItem view](self, "view"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    -[EKDayViewContentItem event](self, "event");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKDayOccurrenceView minNaturalTextHeightForEvent:usingSmallText:sizeClass:](EKDayOccurrenceView, "minNaturalTextHeightForEvent:usingSmallText:sizeClass:", v4, -[EKDayViewContentItem usesSmallText](self, "usesSmallText"), self->_sizeClass);
    v6 = v7 + self->_travelTimeHeight;
  }
  else
  {
    -[EKDayViewContentItem view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewMaxNaturalTextHeight");
    v6 = v5;
  }

  return v6;
}

- (BOOL)usesSmallText
{
  return self->_usesSmallText;
}

- (void)setStagedFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BOOL v8;
  void *v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[EKDayViewContentItem resetVisibleHeight](self, "resetVisibleHeight");
  self->_stagedFrame.origin.x = x;
  self->_stagedFrame.origin.y = y;
  self->_stagedFrame.size.width = width;
  self->_stagedFrame.size.height = height;
  -[EKDayViewContentItem view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKDayViewContentItem isLoadingAsync](self, "isLoadingAsync");
  v9 = v10;
  if (!v8 && v10)
  {
    objc_msgSend(v10, "setFrame:", x, y, width, height);
    v9 = v10;
  }

}

- (BOOL)isLoadingAsync
{
  return self->_isLoadingAsync;
}

- (void)resetVisibleHeight
{
  self->_visibleHeight = 1.79769313e308;
  self->_visibleHeightLocked = 0;
}

- (EKDayOccurrenceView)view
{
  return self->_view;
}

- (NSDate)startWithTravelTime
{
  void *v2;
  void *v3;

  -[EKDayViewContentItem startDateIncludingTravelTime](self, "startDateIncludingTravelTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (EKCalendarDate)endDate
{
  return self->_endDate;
}

- (EKCalendarDate)startDateIncludingTravelTime
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0D0C420];
  -[EKDayViewContentItem startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteTime");
  v6 = v5;
  -[EKDayViewContentItem travelTime](self, "travelTime");
  v8 = v6 - v7;
  -[EKDayViewContentItem startDate](self, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarDateWithAbsoluteTime:timeZone:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKCalendarDate *)v11;
}

- (EKCalendarDate)startDate
{
  return self->_startDate;
}

- (double)travelTime
{
  return self->_travelTime;
}

- (CGRect)unPinnedViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_unPinnedViewFrame.origin.x;
  y = self->_unPinnedViewFrame.origin.y;
  width = self->_unPinnedViewFrame.size.width;
  height = self->_unPinnedViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setUsesSmallText:(BOOL)a3
{
  self->_usesSmallText = a3;
}

- (void)setTravelTime:(double)a3
{
  self->_travelTime = a3;
}

- (void)setTopPinningProximity:(double)a3
{
  void *v4;
  double topPinningProximity;
  id v6;

  self->_topPinningProximity = a3;
  if (!-[EKDayViewContentItem isLoadingAsync](self, "isLoadingAsync"))
  {
    -[EKDayViewContentItem view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      topPinningProximity = self->_topPinningProximity;
      -[EKDayViewContentItem view](self, "view");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTopPinningProximity:", topPinningProximity);

    }
  }
}

- (void)setView:(id)a3
{
  void *v5;
  CUIKORContentPayload *stagedPayload;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_view, a3);
  objc_msgSend(v7, "setTopPinningProximity:", self->_topPinningProximity);
  objc_msgSend(v7, "setBottomPinningProximity:", self->_bottomPinningProximity);
  if (!CGRectIsEmpty(self->_stagedFrame))
    objc_msgSend(v7, "setFrame:", self->_stagedFrame.origin.x, self->_stagedFrame.origin.y, self->_stagedFrame.size.width, self->_stagedFrame.size.height);
  objc_msgSend(v7, "setVisibleHeight:", self->_visibleHeight);
  objc_msgSend(v7, "setTravelTimeSubviewHeightInPoints:", self->_travelTimeHeight);
  if (self->_stagedPayload)
  {
    objc_msgSend(v7, "currentImageState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performChangesWithState:", self->_currentState);

    objc_msgSend(v7, "forceUpdateContentWithPayload:", self->_stagedPayload);
    stagedPayload = self->_stagedPayload;
    self->_stagedPayload = 0;

  }
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setIsProposedTime:(BOOL)a3
{
  self->_isProposedTime = a3;
}

- (void)setHasTrailingDuration:(BOOL)a3
{
  self->_hasTrailingDuration = a3;
}

- (void)setHasPrecedingDuration:(BOOL)a3
{
  self->_hasPrecedingDuration = a3;
}

- (void)setEvent:(id)a3
{
  id v5;
  NSArray *v6;
  NSArray *events;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_event, a3);
  if (v5)
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    events = self->_events;
    self->_events = v6;
  }
  else
  {
    events = self->_events;
    self->_events = (NSArray *)MEMORY[0x1E0C9AA60];
  }

}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setBottomPinningProximity:(double)a3
{
  void *v5;
  id v6;

  self->_bottomPinningProximity = a3;
  if (!-[EKDayViewContentItem isLoadingAsync](self, "isLoadingAsync"))
  {
    -[EKDayViewContentItem view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[EKDayViewContentItem view](self, "view");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBottomPinningProximity:", a3);

    }
  }
}

- (EKDayViewContentItem)initWithEventIndex:(unint64_t)a3 sizeClass:(int64_t)a4
{
  char *v6;
  EKDayViewContentItem *v7;
  __int128 v8;
  __int128 v9;
  CUIKOROccurrenceState *v10;
  CUIKOROccurrenceState *currentState;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)EKDayViewContentItem;
  v6 = -[EKDayViewContentItem init](&v13, sel_init);
  v7 = (EKDayViewContentItem *)v6;
  if (v6)
  {
    v8 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v6 + 40) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v6 + 56) = v8;
    v9 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)(v6 + 8) = *MEMORY[0x1E0C9D648];
    *((_QWORD *)v6 + 18) = a3;
    *(_OWORD *)(v6 + 24) = v9;
    *((_QWORD *)v6 + 9) = 0x7FEFFFFFFFFFFFFFLL;
    *((_QWORD *)v6 + 12) = a4;
    *((_QWORD *)v6 + 13) = -1;
    v10 = (CUIKOROccurrenceState *)objc_alloc_init(MEMORY[0x1E0D0CDA8]);
    currentState = v7->_currentState;
    v7->_currentState = v10;

  }
  return v7;
}

- (EKEvent)event
{
  return self->_event;
}

- (BOOL)isProposedTime
{
  return self->_isProposedTime;
}

- (BOOL)hasTrailingDuration
{
  return self->_hasTrailingDuration;
}

- (BOOL)hasPrecedingDuration
{
  return self->_hasPrecedingDuration;
}

- (void)setUnPinnedViewFrame:(CGRect)a3
{
  self->_unPinnedViewFrame = a3;
}

- (NSDate)end
{
  void *v2;
  void *v3;

  -[EKDayViewContentItem endDate](self, "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (CUIKOROccurrenceState)currentState
{
  return self->_currentState;
}

- (void)_requestPayloadAnimated:(BOOL)a3 drawSynchronously:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  int64_t v13;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D0CDB0], "sharedProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((self->_currentRequestId & 0x8000000000000000) == 0)
  {
    objc_msgSend(v7, "cancelRequest:");
    self->_currentRequestId = -1;
  }
  -[EKDayViewContentItem currentState](self, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "travelTime");
  v10 = 3;
  if (v11 > 0.0)
    v10 = 7;
  if (v5)
    v10 |= 8uLL;
  if (v4)
    v12 = v10 | 0x10;
  else
    v12 = v10;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__EKDayViewContentItem__requestPayloadAnimated_drawSynchronously___block_invoke;
  v14[3] = &unk_1E6018760;
  objc_copyWeak(&v15, &location);
  v13 = objc_msgSend(v8, "requestPayloadForState:requestOptions:resultHandler:", v9, v12, v14);
  if ((v13 & 0x8000000000000000) == 0)
    self->_currentRequestId = v13;
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __66__EKDayViewContentItem__requestPayloadAnimated_drawSynchronously___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateWithPayload:", v3);

}

- (void)_updateWithPayload:(id)a3
{
  char v5;
  int64_t currentRequestId;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = objc_msgSend(v11, "requestOptions");
  currentRequestId = self->_currentRequestId;
  v7 = objc_msgSend(v11, "requestId");
  if ((v5 & 0x10) != 0 || currentRequestId == v7)
  {
    -[EKDayViewContentItem view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "currentImageState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "performChangesWithState:", self->_currentState);

      objc_msgSend(v9, "forceUpdateContentWithPayload:", v11);
    }
    else
    {
      objc_storeStrong((id *)&self->_stagedPayload, a3);
    }
    self->_currentRequestId = -1;

  }
}

- (NSDate)start
{
  void *v2;
  void *v3;

  -[EKDayViewContentItem startDate](self, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (double)travelTimeHeight
{
  double travelTimeHeight;
  void *v4;
  void *v5;
  double v6;

  if (-[EKDayViewContentItem isLoadingAsync](self, "isLoadingAsync"))
    return self->_travelTimeHeight;
  -[EKDayViewContentItem view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[EKDayViewContentItem view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "travelTimeSubviewHeightInPoints");
    travelTimeHeight = v6;

  }
  else
  {
    travelTimeHeight = self->_travelTimeHeight;
  }

  return travelTimeHeight;
}

- (BOOL)isPinned
{
  return self->_topPinningProximity >= 1.0 || self->_bottomPinningProximity >= 1.0;
}

- (void)setTravelTimeHeight:(double)a3
{
  void *v5;
  id v6;

  if (-[EKDayViewContentItem isLoadingAsync](self, "isLoadingAsync")
    || (-[EKDayViewContentItem view](self, "view"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_travelTimeHeight = a3;
  }
  else
  {
    -[EKDayViewContentItem view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTravelTimeSubviewHeightInPoints:", a3);

  }
}

- (BOOL)isEqual:(id)a3
{
  EKDayViewContentItem *v4;
  EKDayViewContentItem *v5;
  NSUInteger v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  char v13;
  EKEvent *event;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (EKDayViewContentItem *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_eventIndex == v5->_eventIndex
        && (v6 = -[NSArray count](self->_events, "count"), v6 == -[NSArray count](v5->_events, "count")))
      {
        if (-[NSArray count](self->_events, "count") < 2)
        {
          event = self->_event;
          if ((unint64_t)event | (unint64_t)v5->_event)
            v13 = -[EKEvent isEqual:](event, "isEqual:");
          else
            v13 = 1;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_events);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v8 = v5->_events;
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v17;
            while (2)
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v17 != v11)
                  objc_enumerationMutation(v8);
                if (!objc_msgSend(v7, "containsObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16))
                {
                  v13 = 0;
                  goto LABEL_23;
                }
              }
              v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
              if (v10)
                continue;
              break;
            }
          }
          v13 = 1;
LABEL_23:

        }
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (void)setEvents:(id)a3
{
  NSArray *v4;
  NSArray *events;
  EKEvent *v6;
  EKEvent *event;

  objc_msgSend(a3, "sortedArrayUsingFunction:context:", MEMORY[0x1E0D0C958], 0);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  events = self->_events;
  self->_events = v4;

  -[NSArray firstObject](self->_events, "firstObject");
  v6 = (EKEvent *)objc_claimAutoreleasedReturnValue();
  event = self->_event;
  self->_event = v6;

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)EKDayViewContentItem;
  -[EKDayViewContentItem description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[EKDayViewContentItem event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayViewContentItem startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayViewContentItem endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayViewContentItem travelTime](self, "travelTime");
  CUIKDisplayStringForTravelTimeUsingShortFormat();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ title: [%@], start date: [%@], end date: [%@], travelTime: [%@]"), v3, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)eventIdentifier
{
  void *v2;
  void *v3;

  -[EKDayViewContentItem event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)visibleHeightLocked
{
  return self->_visibleHeightLocked;
}

- (void)setVisibleHeight:(double)a3
{
  void *v5;
  id v6;

  if (!self->_visibleHeightLocked && self->_visibleHeight != a3)
  {
    self->_visibleHeight = a3;
    self->_visibleHeightLocked = 1;
    if (!-[EKDayViewContentItem isLoadingAsync](self, "isLoadingAsync"))
    {
      -[EKDayViewContentItem view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[EKDayViewContentItem view](self, "view");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setVisibleHeight:", a3);

      }
    }
  }
}

+ (double)barToBarHorizontalDistanceIncludingBarWidth
{
  double result;

  +[EKDayOccurrenceView barToBarHorizontalDistanceIncludingBarWidth](EKDayOccurrenceView, "barToBarHorizontalDistanceIncludingBarWidth");
  return result;
}

- (NSArray)events
{
  return self->_events;
}

- (BOOL)occurrenceIsFirstVisibleDayOfEvent
{
  return self->_occurrenceIsFirstVisibleDayOfEvent;
}

- (void)setOccurrenceIsFirstVisibleDayOfEvent:(BOOL)a3
{
  self->_occurrenceIsFirstVisibleDayOfEvent = a3;
}

- (unint64_t)eventIndex
{
  return self->_eventIndex;
}

- (double)topPinningProximity
{
  return self->_topPinningProximity;
}

- (double)bottomPinningProximity
{
  return self->_bottomPinningProximity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_stagedPayload, 0);
}

@end
