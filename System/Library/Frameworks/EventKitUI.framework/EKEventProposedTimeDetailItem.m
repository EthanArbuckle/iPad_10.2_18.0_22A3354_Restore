@implementation EKEventProposedTimeDetailItem

- (void)reset
{
  void *v3;
  uint64_t v4;

  -[NSMutableDictionary allKeys](self->_cellForAttendee, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    self->_visibilityChanged = 1;
  -[NSMutableDictionary removeAllObjects](self->_cellForAttendee, "removeAllObjects");
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSArray **p_attendeesWithProposedTimes;
  BOOL v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  self->_visibilityChanged = 0;
  obj = (id)objc_opt_new();
  -[EKEvent organizer](self->super._event, "organizer");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[EKEvent organizer](self->super._event, "organizer"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isCurrentUser"),
        v7,
        v6,
        !v8))
  {
    v19 = 0;
    goto LABEL_17;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[EKEvent attendees](self->super._event, "attendees");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v10)
    goto LABEL_15;
  v11 = v10;
  v12 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v23 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      objc_msgSend(v14, "proposedStartDateForEvent:", self->super._event);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[EKEvent startDate](self->super._event, "startDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToDate:", v16) & 1) == 0)
        {
          v17 = objc_msgSend(v14, "proposedStartDateStatus");

          if (v17 == 3)
            goto LABEL_13;
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA9FF8]), "initWithParticipant:forEvent:", v14, self->super._event);
          objc_msgSend(obj, "addObject:", v16);
        }

      }
LABEL_13:

    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v11);
LABEL_15:

  p_attendeesWithProposedTimes = &self->_attendeesWithProposedTimes;
  objc_storeStrong((id *)p_attendeesWithProposedTimes, obj);
  v19 = -[NSArray count](*p_attendeesWithProposedTimes, "count") != 0;
LABEL_17:

  return v19;
}

- (void)setCellPosition:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventProposedTimeDetailItem;
  -[EKEventDetailItem setCellPosition:](&v3, sel_setCellPosition_, *(_QWORD *)&a3);
}

- (void)_updateCellsIfNeededForWidth:(double)a3
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_cellForAttendee, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_59, a3);
}

uint64_t __62__EKEventProposedTimeDetailItem__updateCellsIfNeededForWidth___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "update");
}

- (unint64_t)numberOfSubitems
{
  return -[NSArray count](self->_attendeesWithProposedTimes, "count");
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[EKEventProposedTimeDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1148846080;
  LODWORD(v7) = 1112014848;
  objc_msgSend(v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a4, 0.0, v6, v7);
  v9 = v8;

  return v9;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  NSMutableDictionary *v5;
  NSMutableDictionary *cellForAttendee;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  EKEventDetailProposedTimeCell *v11;
  NSMutableDictionary *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t v18[16];

  if (!self->_cellForAttendee)
  {
    v5 = (NSMutableDictionary *)objc_opt_new();
    cellForAttendee = self->_cellForAttendee;
    self->_cellForAttendee = v5;

  }
  -[EKEventProposedTimeDetailItem attendeeForIndex:](self, "attendeeForIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = self->_cellForAttendee;
    objc_msgSend(v7, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10);
    v11 = (EKEventDetailProposedTimeCell *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v11 = -[EKEventDetailProposedTimeCell initWithEvent:andAttendee:]([EKEventDetailProposedTimeCell alloc], "initWithEvent:andAttendee:", self->super._event, v8);
      -[EKEventDetailProposedTimeCell update](v11, "update");
      v12 = self->_cellForAttendee;
      objc_msgSend(v8, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

      self->_visibilityChanged = 1;
    }
    if (a3)
      v14 = 0;
    else
      v14 = 3;
    -[EKEventDetailProposedTimeCell setShowsTopSeparator:](v11, "setShowsTopSeparator:", a3 != 0);
    if (-[NSArray count](self->_attendeesWithProposedTimes, "count") - 1 == a3)
      v15 = v14 | 0xC;
    else
      v15 = v14;
    -[EKEventDetailProposedTimeCell setRoundedCorners:](v11, "setRoundedCorners:", v15);
  }
  else
  {
    v16 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1AF84D000, v16, OS_LOG_TYPE_ERROR, "No attendee found for proposed time detail item.  We shouldn't be drawn, but tableview thinks we want to display, returning empty cell", v18, 2u);
    }
    v11 = (EKEventDetailProposedTimeCell *)objc_opt_new();
  }

  return v11;
}

- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3
{
  return 1;
}

- (id)attendeeForIndex:(unint64_t)a3
{
  void *v5;

  if (-[EKEventProposedTimeDetailItem numberOfSubitems](self, "numberOfSubitems") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_attendeesWithProposedTimes, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  void *v6;
  EKUIProposedTimeEventViewController *v7;
  _QWORD v9[6];

  -[EKEventProposedTimeDetailItem attendeeForIndex:](self, "attendeeForIndex:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EKUIProposedTimeEventViewController initWithProposedTimeAttendee:]([EKUIProposedTimeEventViewController alloc], "initWithProposedTimeAttendee:", v6);
  -[EKUIProposedTimeEventViewController setEvent:](v7, "setEvent:", self->super._event);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__EKEventProposedTimeDetailItem_detailViewControllerWithFrame_forSubitemAtIndex___block_invoke;
  v9[3] = &unk_1E6018FC8;
  v9[4] = self;
  v9[5] = a4;
  -[EKUIProposedTimeEventViewController setCompletionBlock:](v7, "setCompletionBlock:", v9);

  return v7;
}

uint64_t __81__EKEventProposedTimeDetailItem_detailViewControllerWithFrame_forSubitemAtIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifySubitemDidSave:", *(_QWORD *)(a1 + 40));
}

- (BOOL)detailItemVisibilityChanged
{
  return self->_visibilityChanged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attendeesWithProposedTimes, 0);
  objc_storeStrong((id *)&self->_cellForAttendee, 0);
}

@end
