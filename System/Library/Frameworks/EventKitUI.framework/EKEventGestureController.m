@implementation EKEventGestureController

- (EKDayOccurrenceView)draggingView
{
  return self->_draggingView;
}

- (BOOL)dragGestureInProgress
{
  if ((self->_pendingDraggingState & 0xFFFFFFFD) != 0)
    return (self->_currentDraggingState < 5u) & (0x1Au >> self->_currentDraggingState);
  else
    return 0;
}

- (void)setUsesHorizontalDragLocking:(BOOL)a3
{
  self->_usesHorizontalDragLocking = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (EKEventGestureController)initWithView:(id)a3
{
  id v4;
  EKEventGestureController *v5;
  EKEventGestureController *v6;
  uint64_t v7;
  UITapGestureRecognizer *tapGestureRecognizer;
  uint64_t v9;
  UILongPressGestureRecognizer *draggingGestureRecognizer;
  uint64_t v11;
  UIDropInteraction *dropInteraction;
  uint64_t v13;
  UIDragInteraction *dragInteraction;
  uint64_t v15;
  UITapGestureRecognizer *multiSelectGestureRecognizer;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *sessionIdentifierForDebug;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EKEventGestureController;
  v5 = -[EKEventGestureController init](&v23, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_targetView, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v6, sel__tapGesture_);
    tapGestureRecognizer = v6->_tapGestureRecognizer;
    v6->_tapGestureRecognizer = (UITapGestureRecognizer *)v7;

    -[UITapGestureRecognizer setCancelsTouchesInView:](v6->_tapGestureRecognizer, "setCancelsTouchesInView:", 0);
    objc_msgSend(v4, "addGestureRecognizer:", v6->_tapGestureRecognizer);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v6, sel__longPress_);
    draggingGestureRecognizer = v6->_draggingGestureRecognizer;
    v6->_draggingGestureRecognizer = (UILongPressGestureRecognizer *)v9;

    -[UILongPressGestureRecognizer setDelaysTouchesBegan:](v6->_draggingGestureRecognizer, "setDelaysTouchesBegan:", 0);
    -[UILongPressGestureRecognizer setDelegate:](v6->_draggingGestureRecognizer, "setDelegate:", v6);
    objc_msgSend(v4, "addGestureRecognizer:", v6->_draggingGestureRecognizer);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3780]), "initWithDelegate:", v6);
    dropInteraction = v6->_dropInteraction;
    v6->_dropInteraction = (UIDropInteraction *)v11;

    objc_msgSend(v4, "addInteraction:", v6->_dropInteraction);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3750]), "initWithDelegate:", v6);
    dragInteraction = v6->_dragInteraction;
    v6->_dragInteraction = (UIDragInteraction *)v13;

    -[UIDragInteraction setEnabled:](v6->_dragInteraction, "setEnabled:", 1);
    objc_msgSend(v4, "addInteraction:", v6->_dragInteraction);
    v6->_currentDropDataOwnerCache = 0;
    -[UIDragInteraction _setPointerLiftDelay:](v6->_dragInteraction, "_setPointerLiftDelay:", 0.25);
    -[UIDragInteraction _setAllowsPointerDragBeforeLiftDelay:](v6->_dragInteraction, "_setAllowsPointerDragBeforeLiftDelay:", 0);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v6, sel__multiSelect_);
    multiSelectGestureRecognizer = v6->_multiSelectGestureRecognizer;
    v6->_multiSelectGestureRecognizer = (UITapGestureRecognizer *)v15;

    -[UITapGestureRecognizer setAllowedTouchTypes:](v6->_multiSelectGestureRecognizer, "setAllowedTouchTypes:", &unk_1E606FA88);
    -[UITapGestureRecognizer setDelegate:](v6->_multiSelectGestureRecognizer, "setDelegate:", v6);
    objc_msgSend(v4, "addGestureRecognizer:", v6->_multiSelectGestureRecognizer);
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[EKEventGestureController hash](v6, "hash"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "substringToIndex:", 4);
    v20 = objc_claimAutoreleasedReturnValue();
    sessionIdentifierForDebug = v6->_sessionIdentifierForDebug;
    v6->_sessionIdentifierForDebug = (NSString *)v20;

    *(_QWORD *)&v6->_pendingDraggingState = -1;
    v6->_snappingTypeForCurrentDrag = 0;
  }

  return v6;
}

- (void)dealloc
{
  _UIDragSnappingFeedbackGenerator *dragSnappingFeedback;
  _UIDragSnappingFeedbackGenerator *v4;
  objc_super v5;

  dragSnappingFeedback = self->_dragSnappingFeedback;
  if (dragSnappingFeedback)
  {
    -[_UIDragSnappingFeedbackGenerator userInteractionEnded](dragSnappingFeedback, "userInteractionEnded");
    v4 = self->_dragSnappingFeedback;
    self->_dragSnappingFeedback = 0;

  }
  -[EKEventGestureController _removeScrollTimer](self, "_removeScrollTimer");
  -[EKEventGestureController removeDraggedOccurrence](self, "removeDraggedOccurrence");
  v5.receiver = self;
  v5.super_class = (Class)EKEventGestureController;
  -[EKEventGestureController dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  void *v4;
  UIDropInteraction *dropInteraction;
  void *v6;
  UIDragInteraction *dragInteraction;

  if (self->_draggingView)
    -[EKEventGestureController _cancel](self, "_cancel");
  -[EKEventGestureController _removeScrollTimer](self, "_removeScrollTimer");
  -[UILongPressGestureRecognizer view](self->_draggingGestureRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_draggingGestureRecognizer);

  -[EKEventGestureController setDelegate:](self, "setDelegate:", 0);
  -[EKEventGestureController setUntimedDelegate:](self, "setUntimedDelegate:", 0);
  -[EKEventGestureController setEvent:](self, "setEvent:", 0);
  -[UIDropInteraction view](self->_dropInteraction, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeInteraction:", self->_dropInteraction);

  dropInteraction = self->_dropInteraction;
  self->_dropInteraction = 0;

  -[UIDragInteraction view](self->_dragInteraction, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeInteraction:", self->_dragInteraction);

  dragInteraction = self->_dragInteraction;
  self->_dragInteraction = 0;

}

- (void)updateDraggingOccurrence
{
  -[EKEventGestureController updateDraggingOccurrenceForced:animated:](self, "updateDraggingOccurrenceForced:animated:", 0, 1);
}

- (void)updateDraggingOccurrenceForced:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  id v23;
  void *v24;

  if (self->_draggingView)
  {
    v4 = a4;
    if (a3
      || -[UILongPressGestureRecognizer state](self->_draggingGestureRecognizer, "state") != 3
      && -[UILongPressGestureRecognizer state](self->_draggingGestureRecognizer, "state") != 5
      && -[UILongPressGestureRecognizer state](self->_draggingGestureRecognizer, "state"))
    {
      if (-[UILongPressGestureRecognizer state](self->_draggingGestureRecognizer, "state") != 1
        && -[UILongPressGestureRecognizer state](self->_draggingGestureRecognizer, "state") != 2
        && !-[EKEventGestureController dragGestureInProgress](self, "dragGestureInProgress"))
      {
        goto LABEL_7;
      }
      -[EKDayOccurrenceView superview](self->_draggingView, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "occurrenceViewSuperviewForEventGestureController:", self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 == v8)
      {
        -[EKEventGestureController _update](self, "_update");
      }
      else
      {
LABEL_7:
        -[EKEventGestureController _calculateFrameForDraggingViewIncludingTravelTime:](self, "_calculateFrameForDraggingViewIncludingTravelTime:", 0);
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v17 = -[EKEvent changingAllDayPropertyIsAllowed](self->_event, "changingAllDayPropertyIsAllowed");
        if (v17)
        {
          v18 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v18, "eventGestureController:adjustDraggingView:forAllDay:", self, self->_draggingView, -[EKEvent isAllDay](self->_event, "isAllDay"));

        }
        if (v4)
        {
          -[EKDayOccurrenceView animateToFrame:isAllDay:beginFromCurrentState:whenFinished:](self->_draggingView, "animateToFrame:isAllDay:beginFromCurrentState:whenFinished:", -[EKEvent isAllDay](self->_event, "isAllDay"), 0, 0, v10, v12, v14, v16);
        }
        else
        {
          -[EKDayOccurrenceView setFrame:](self->_draggingView, "setFrame:", v10, v12, v14, v16);
          if (v17)
            -[EKDayOccurrenceView setAllDay:](self->_draggingView, "setAllDay:", -[EKEvent isAllDay](self->_event, "isAllDay"));
          -[EKDayOccurrenceView setDrawsResizeHandles:](self->_draggingView, "setDrawsResizeHandles:", -[EKEvent isAllDay](self->_event, "isAllDay") ^ 1);
        }
        v19 = objc_loadWeakRetained((id *)&self->_delegate);
        -[EKDayOccurrenceView occurrence](self->_draggingView, "occurrence");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEvent startDate](self->_event, "startDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSinceReferenceDate");
        objc_msgSend(v19, "eventGestureController:didCommitOccurrence:toDate:isAllDay:span:", self, v20, -[EKEvent isAllDay](self->_event, "isAllDay"), 0, v22);

        if (-[UILongPressGestureRecognizer state](self->_draggingGestureRecognizer, "state") != 1)
        {
          v23 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v23, "eventGestureController:addViewToScroller:isAllDay:", self, self->_draggingView, -[EKEvent isAllDay](self->_event, "isAllDay"));

          -[EKDayOccurrenceView superview](self->_draggingView, "superview");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "bringSubviewToFront:", self->_draggingView);

          -[EKDayOccurrenceView bringResizeHandlesToFront](self->_draggingView, "bringResizeHandlesToFront");
        }
      }
    }
  }
}

- (CGRect)_calculateFrameForDraggingViewIncludingTravelTime:(BOOL)a3
{
  EKEvent *event;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id WeakRetained;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int64_t touchOffsetDays;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGRect result;

  if (self->_draggingView)
  {
    event = self->_event;
    if (a3)
      -[EKEvent startDateIncludingTravel](event, "startDateIncludingTravel");
    else
      -[EKEvent startDate](event, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v11 = v10;
    if (-[EKEventGestureController splitMultiDays](self, "splitMultiDays") || self->_touchOffsetDays >= 1)
    {
      -[EKCalendarDate absoluteTime](self->_currentDay, "absoluteTime");
      v11 = v12;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "eventGestureController:pointAtDate:isAllDay:", self, -[EKEvent isAllDay](self->_event, "isAllDay"), v11);
    v15 = v14;
    v17 = v16;

    -[EKEvent durationIncludingTravel](self->_event, "durationIncludingTravel");
    v19 = fmin(v18, 86400.0);
    if (!-[EKEvent isAllDay](self->_event, "isAllDay"))
    {
      touchOffsetDays = self->_touchOffsetDays;
      if (touchOffsetDays >= 1 && touchOffsetDays + 1 == -[EKEvent daySpan](self->_event, "daySpan"))
      {
        v21 = (void *)MEMORY[0x1E0D0C420];
        -[EKEvent endDateUnadjustedForLegacyClients](self->_event, "endDateUnadjustedForLegacyClients");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEvent timeZone](self->_event, "timeZone");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "calendarDateWithDate:timeZone:", v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "absoluteTime");
        v26 = v25;
        objc_msgSend(v24, "calendarDateForDay");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "absoluteTime");
        v19 = v26 - v28;

      }
    }
    -[EKEventGestureController _computeWidthForOccurrenceView](self, "_computeWidthForOccurrenceView");
    v7 = v29;
    -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", self->_event, -[EKEvent isAllDay](self->_event, "isAllDay"), v19);
    v8 = v30;
    -[EKEventGestureController _computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:](self, "_computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:", -[EKEvent isAllDay](self->_event, "isAllDay"), 0, 1, v15, v17, v11);
    v5 = v31;
    v6 = v32;
    v33 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v33, "occurrenceViewSuperviewForEventGestureController:", self);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKDayOccurrenceView superview](self->_draggingView, "superview");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35 != v34)
    {
      -[EKDayOccurrenceView superview](self->_draggingView, "superview");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "convertRect:toView:", v36, v5, v6, v7, v8);
      v5 = v37;
      v6 = v38;
      v7 = v39;
      v8 = v40;

    }
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v41 = v5;
  v42 = v6;
  v43 = v7;
  v44 = v8;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (void)updateDraggingOccurrenceFrame
{
  if (self->_draggingView)
  {
    -[EKEventGestureController _calculateFrameForDraggingViewIncludingTravelTime:](self, "_calculateFrameForDraggingViewIncludingTravelTime:", 1);
    -[EKDayOccurrenceView setFrame:](self->_draggingView, "setFrame:");
    -[EKDayOccurrenceView setDrawsResizeHandles:](self->_draggingView, "setDrawsResizeHandles:", -[EKEvent isAllDay](self->_event, "isAllDay") ^ 1);
  }
}

- (void)removeDraggedOccurrence
{
  EKDayOccurrenceView *draggingView;
  EKDayOccurrenceView *v4;

  draggingView = self->_draggingView;
  if (draggingView)
  {
    -[EKDayOccurrenceView removeFromSuperview](draggingView, "removeFromSuperview");
    -[EKEventGestureController _hideEditingMenuForView:](self, "_hideEditingMenuForView:", self->_draggingView);
    v4 = self->_draggingView;
    self->_draggingView = 0;

  }
  -[EKEventGestureController setEvent:](self, "setEvent:", 0);
}

- (void)promptUserForRecurrenceActionOnOccurrence:(id)a3 whenFinished:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  EKUIRecurrenceAlertController *v13;
  EKUIRecurrenceAlertController *recurrenceAlertController;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  -[EKEventGestureController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[EKEventGestureController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentPresentationController");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v11 = (void *)v10;

    goto LABEL_6;
  }
  -[EKEventGestureController untimedDelegate](self, "untimedDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[EKEventGestureController untimedDelegate](self, "untimedDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "eventGestureControllerCurrentPresentationController:", self);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__EKEventGestureController_promptUserForRecurrenceActionOnOccurrence_whenFinished___block_invoke;
  v15[3] = &unk_1E601CA00;
  v15[4] = self;
  v16 = v7;
  v12 = v7;
  +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:barButtonItem:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:barButtonItem:forEvent:withCompletionHandler:", 2, v11, 0, v6, v15);
  v13 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v13;

}

void __83__EKEventGestureController_promptUserForRecurrenceActionOnOccurrence_whenFinished___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  switch(a2)
  {
    case 4:
    case 5:
      return;
    default:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 272);
      *(_QWORD *)(v3 + 272) = 0;

      break;
  }
}

- (void)promptUserForProposeNewTime:(id)a3 forEvent:(id)a4 whenFinished:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v33 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "organizer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CAA0E8], "participantForSortingWithEKParticipant:", v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  EventKitUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Propose a new time?"), &stru_1E601DFA8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  EventKitUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Ask %@ to move “%@” to %@ at %@"), &stru_1E601DFA8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "localizedRelativeDateStringShortened:lowercase:", 0, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeStringAlwaysIncludeMinutes:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "localizedStringWithFormat:", v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  EventKitUIBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Cancel - prompt user for propose new time"), CFSTR("Cancel"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  EventKitUIBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Send"), &stru_1E601DFA8, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v10, v18, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0DC3448];
  v25 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __78__EKEventGestureController_promptUserForProposeNewTime_forEvent_whenFinished___block_invoke;
  v39[3] = &unk_1E601C010;
  v26 = v33;
  v40 = v26;
  objc_msgSend(v24, "actionWithTitle:style:handler:", v20, 1, v39);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAction:", v27);

  v28 = (void *)MEMORY[0x1E0DC3448];
  v37[0] = v25;
  v37[1] = 3221225472;
  v37[2] = __78__EKEventGestureController_promptUserForProposeNewTime_forEvent_whenFinished___block_invoke_2;
  v37[3] = &unk_1E601C010;
  v38 = v26;
  v29 = v26;
  objc_msgSend(v28, "actionWithTitle:style:handler:", v22, 0, v37);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAction:", v30);

  -[EKEventGestureController delegate](self, "delegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "currentPresentationController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "presentViewController:animated:completion:", v23, 1, 0);

}

uint64_t __78__EKEventGestureController_promptUserForProposeNewTime_forEvent_whenFinished___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __78__EKEventGestureController_promptUserForProposeNewTime_forEvent_whenFinished___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;
  BOOL v6;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = v4;
  v6 = self->_multiSelectGestureRecognizer != v4
    || (-[UITapGestureRecognizer modifierFlags](v4, "modifierFlags") & 0x120000) != 0;

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  BOOL v7;
  EKEventGestureControllerUntimedDelegate **p_untimedDelegate;
  id WeakRetained;
  id v10;
  id v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  BOOL v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;
  CGPoint v57;
  CGPoint v58;
  CGPoint v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!objc_msgSend(a3, "state"))
  {
    p_untimedDelegate = &self->_untimedDelegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

    if (WeakRetained
      || (p_untimedDelegate = &self->_delegate,
          v10 = objc_loadWeakRetained((id *)&self->_delegate),
          v10,
          v10))
    {
      v11 = objc_loadWeakRetained((id *)p_untimedDelegate);
      objc_msgSend(v11, "touchTrackingViewForEventGestureController:", self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "bounds");
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        objc_msgSend(v6, "locationInView:", v12);
        v57.x = v21;
        v57.y = v22;
        v60.origin.x = v14;
        v60.origin.y = v16;
        v60.size.width = v18;
        v60.size.height = v20;
        if (!CGRectContainsPoint(v60, v57))
          goto LABEL_22;
      }
    }
    else
    {
      v12 = 0;
    }
    if (!self->_forcedStart)
      goto LABEL_21;
    -[EKDayOccurrenceView bounds](self->_draggingView, "bounds");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    objc_msgSend(v6, "locationInView:", self->_draggingView);
    v58.x = v31;
    v58.y = v32;
    v61.origin.x = v24;
    v61.origin.y = v26;
    v61.size.width = v28;
    v61.size.height = v30;
    v33 = CGRectContainsPoint(v61, v58);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[EKDayOccurrenceView arrayOfResizeHandles](self->_draggingView, "arrayOfResizeHandles", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v52 != v37)
            objc_enumerationMutation(v34);
          if (v33)
          {
            v33 = 1;
          }
          else
          {
            v39 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(v39, "bounds");
            v41 = v40;
            v43 = v42;
            v45 = v44;
            v47 = v46;
            objc_msgSend(v6, "locationInView:", v39);
            v59.x = v48;
            v59.y = v49;
            v62.origin.x = v41;
            v62.origin.y = v43;
            v62.size.width = v45;
            v62.size.height = v47;
            v33 = CGRectContainsPoint(v62, v59);
          }
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      }
      while (v36);
    }

    if (v33)
    {
LABEL_21:
      v7 = 1;
LABEL_23:

      goto LABEL_24;
    }
LABEL_22:
    v7 = 0;
    goto LABEL_23;
  }
  v7 = 1;
LABEL_24:

  return v7;
}

- (void)updateDraggingOccurrenceOrigin
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[EKEventGestureController _calculateFrameForDraggingViewIncludingTravelTime:](self, "_calculateFrameForDraggingViewIncludingTravelTime:", 1);
  v4 = v3;
  v6 = v5;
  -[EKEventGestureController draggingView](self, "draggingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;

  -[EKDayOccurrenceView setFrame:](self->_draggingView, "setFrame:", v4, v6, v9, v11);
}

- (void)updateDraggingOccurrenceFrameFromSource
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "occurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "occurrenceDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "eventGestureController:occurrenceViewForOccurrence:occurrenceDate:", self, v5, v7);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v27;
  if (v27)
  {
    -[EKEventGestureController setDraggingViewSource:](self, "setDraggingViewSource:", v27);
    -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;

    -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v18 = v17;
    v20 = v19;
    -[EKDayOccurrenceView superview](self->_draggingView, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertPoint:toView:", v21, v18, v20);
    v23 = v22;
    v25 = v24;

    -[EKEventGestureController draggingView](self, "draggingView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v23, v25, v11, v13);

    v8 = v27;
  }

}

- (int64_t)_occurrenceDateIndexWithEvent:(id)a3 occurrenceDate:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;

  v5 = a4;
  objc_msgSend(a3, "startCalendarDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "differenceInDays:", v6);

  return v7;
}

- (void)forceStartWithOccurrence:(id)a3 occurrenceDate:(id)a4 shouldUpdateViewSource:(BOOL)a5 shouldUpdateOrigin:(BOOL)a6 shouldPresentEditMenu:(BOOL)a7
{
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  EKEventGestureController *v18;
  id v19;
  SEL v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;

  v15 = a3;
  v13 = a4;
  if (!self->_isDragging
    && !-[EKEventGestureController dragGestureInProgress](self, "dragGestureInProgress")
    && !self->_forcedStart)
  {
    v14 = (void *)MEMORY[0x1E0DC3F10];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __132__EKEventGestureController_forceStartWithOccurrence_occurrenceDate_shouldUpdateViewSource_shouldUpdateOrigin_shouldPresentEditMenu___block_invoke;
    v16[3] = &unk_1E601CA28;
    v20 = a2;
    v17 = v15;
    v18 = self;
    v19 = v13;
    v21 = a5;
    v22 = a7;
    v23 = a6;
    objc_msgSend(v14, "performWithoutAnimation:", v16);

  }
}

void __132__EKEventGestureController_forceStartWithOccurrence_occurrenceDate_shouldUpdateViewSource_shouldUpdateOrigin_shouldPresentEditMenu___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  char v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id WeakRetained;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  int v21;
  int v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL IsEmpty;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  id v63;
  CGRect v64;

  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("CalendarEventGestures.m"), 572, CFSTR("Attempted to force start a drag with a nil occurrence"));

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 264) = 1;
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 45) && *(_QWORD *)(v2 + 56))
  {
    v3 = objc_msgSend(*(id *)(v2 + 56), "isHidden");
    v2 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend((id)v2, "removeDraggedOccurrence");
  objc_msgSend(*(id *)(a1 + 40), "setEvent:", *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) = objc_msgSend(*(id *)(a1 + 40), "_occurrenceDateIndexWithEvent:occurrenceDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setMinimumPressDuration:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "eventGestureController:shouldAllowShortLiftDelay:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

    if ((v6 & 1) == 0)
    {
      v7 = 0.25;
      _UIDragInteractionDefaultLiftDelay();
      goto LABEL_12;
    }
  }
  else
  {

  }
  v7 = 0.04;
  v8 = 0.04;
LABEL_12:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 304), "_setLiftDelay:", v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 304), "_setPointerLiftDelay:", v7);
  objc_msgSend(*(id *)(a1 + 32), "startCalendarDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "calendarDateByAddingDays:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "calendarDateForDay");
  v63 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 344));
  v12 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v63, "absoluteTime");
  objc_msgSend(WeakRetained, "eventGestureController:pointAtDate:isAllDay:", v12, objc_msgSend(*(id *)(a1 + 32), "isAllDay"), v13);
  v15 = v14;
  v17 = v16;

  v18 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 344));
  objc_msgSend(v18, "timedRegionOriginForEventGestureController:", *(_QWORD *)(a1 + 40));
  v20 = v19;

  v21 = objc_msgSend(*(id *)(a1 + 32), "isAllDay");
  if (v17 >= v20)
    v22 = 1;
  else
    v22 = v21;
  if (!v22)
    v17 = v20;
  if (*(_BYTE *)(a1 + 64))
  {
    v23 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 344));
    objc_msgSend(v23, "eventGestureController:occurrenceViewForOccurrence:occurrenceDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setDraggingViewSource:", v24);

  }
  v25 = *(_QWORD *)(a1 + 40);
  *(double *)(v25 + 88) = v15;
  *(double *)(v25 + 96) = v17;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 217) = 1;
  v26 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 336));

  v27 = *(_QWORD *)(a1 + 40);
  if (v26)
  {
    v28 = objc_loadWeakRetained((id *)(v27 + 336));
    objc_msgSend(v28, "eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:", *(_QWORD *)(a1 + 40), 0, 0, v15, v17);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(a1 + 40);
    v31 = *(void **)(v30 + 64);
    *(_QWORD *)(v30 + 64) = v29;

  }
  else
  {
    v35 = objc_loadWeakRetained((id *)(v27 + 344));

    if (v35)
    {
      objc_msgSend(*(id *)(a1 + 40), "_createTemporaryView:animated:", *(_QWORD *)(a1 + 32), 1);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = *(_QWORD *)(a1 + 40);
      v38 = *(void **)(v37 + 56);
      *(_QWORD *)(v37 + 56) = v36;

      if (*(_BYTE *)(a1 + 65))
        objc_msgSend(*(id *)(a1 + 40), "_updatePositionOfEditingMenuForView:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
      if (v3)
        objc_msgSend(*(id *)(a1 + 40), "_setLocalDraggingViewHidden:", 1);
      if ((objc_msgSend(*(id *)(a1 + 32), "isNew") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "draggingViewSource");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          objc_msgSend(*(id *)(a1 + 40), "draggingViewSource");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "travelTimeSubviewHeightInPoints");
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setTravelTimeSubviewHeightInPoints:");

          objc_msgSend(*(id *)(a1 + 40), "draggingViewSource");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "frame");
          IsEmpty = CGRectIsEmpty(v64);

          if (!IsEmpty)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "frame");
            v44 = v43;
            v46 = v45;
            objc_msgSend(*(id *)(a1 + 40), "draggingViewSource");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "frame");

            objc_msgSend(*(id *)(a1 + 40), "draggingViewSource");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "superview");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "draggingViewSource");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "frame");
            v52 = v51;
            v54 = v53;
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "superview");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "convertPoint:toView:", v55, v52, v54);
            v57 = v56;

            if (*(_BYTE *)(a1 + 66))
              v46 = v57;
            objc_msgSend(*(id *)(a1 + 40), "_computeWidthForOccurrenceView");
            v59 = v58;
            objc_msgSend(*(id *)(a1 + 32), "durationIncludingTravel");
            objc_msgSend(*(id *)(a1 + 40), "_computeHeightForOccurrenceViewOfDuration:event:allDay:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "isAllDay"), fmin(v60, 86400.0));
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setFrame:", v44, v46, v59, v61);
          }
        }
      }
    }
  }
  v32 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v32 + 202) || !*(_QWORD *)(v32 + 176))
  {
    if (!v3 || (v33 = objc_msgSend(*(id *)(v32 + 56), "isHidden"), v32 = *(_QWORD *)(a1 + 40), (v33 & 1) == 0))
    {
      objc_msgSend(*(id *)(v32 + 56), "setDrawsResizeHandles:", 1);
      v32 = *(_QWORD *)(a1 + 40);
    }
  }
  v34 = objc_loadWeakRetained((id *)(v32 + 344));
  objc_msgSend(v34, "eventGestureController:addViewToScroller:isAllDay:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), objc_msgSend(*(id *)(a1 + 32), "isAllDay"));

}

- (void)endForcedStartAndUndim
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "eventGestureController:didCancelEditingOccurrence:fadedOut:", self, self->_event, 1);

  -[EKEventGestureController endForcedStart](self, "endForcedStart");
}

- (void)endForcedStart
{
  if (-[UILongPressGestureRecognizer state](self->_draggingGestureRecognizer, "state") != 1
    && -[UILongPressGestureRecognizer state](self->_draggingGestureRecognizer, "state") != 2
    && (self->_forcedStart || self->_currentDraggingState || self->_pendingDraggingState != 3))
  {
    -[EKEventGestureController _cleanUpForcedStart](self, "_cleanUpForcedStart");
    -[EKEventGestureController removeDraggedOccurrence](self, "removeDraggedOccurrence");
    -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 0, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }
}

- (void)liftUpOccurrenceForEditingEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((self->_currentDraggingState | 2) == 2)
  {
    v5 = v4;
    -[EKEventGestureController forceStartWithOccurrence:occurrenceDate:shouldUpdateViewSource:shouldUpdateOrigin:shouldPresentEditMenu:](self, "forceStartWithOccurrence:occurrenceDate:shouldUpdateViewSource:shouldUpdateOrigin:shouldPresentEditMenu:", v4, 0, 0, 0, 0);
    v4 = v5;
    self->_currentDraggingState = 2;
  }

}

- (void)_cleanUpForcedStart
{
  _QWORD block[5];

  self->_dragInitiationLocked = 1;
  if (self->_forcedStart)
  {
    self->_forcedStart = 0;
    -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_draggingGestureRecognizer, "setMinimumPressDuration:", 0.4);
    _UIDragInteractionDefaultLiftDelay();
    -[UIDragInteraction _setLiftDelay:](self->_dragInteraction, "_setLiftDelay:");
    -[UIDragInteraction _setPointerLiftDelay:](self->_dragInteraction, "_setPointerLiftDelay:", 0.25);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__EKEventGestureController__cleanUpForcedStart__block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  self->_touchOffsetDays = 0;
  self->_commitOffsetDays = 0;
}

uint64_t __47__EKEventGestureController__cleanUpForcedStart__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 48) = 0;
  return result;
}

- (void)_tapGesture:(id)a3
{
  EKEventGestureControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "touchTrackingViewForEventGestureController:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  v12 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v12, "eventGestureController:occurrenceViewAtPoint:ignoreSelectedCopyView:", self, 0, v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v13, "isAllDay") & 1) == 0)
  {
    v14 = objc_alloc(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v13, "frameOfOpaqueContent");
    v15 = (void *)objc_msgSend(v14, "initWithFrame:");
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerRadius:", 4.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v17);

    objc_msgSend(v15, "setUserInteractionEnabled:", 0);
    objc_msgSend(v13, "insertSubview:atIndex:", v15, 0);
    v18 = (void *)MEMORY[0x1E0DC3F10];
    v19 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __40__EKEventGestureController__tapGesture___block_invoke;
    v23[3] = &unk_1E6018688;
    v24 = v15;
    v21[0] = v19;
    v21[1] = 3221225472;
    v21[2] = __40__EKEventGestureController__tapGesture___block_invoke_2;
    v21[3] = &unk_1E6018638;
    v22 = v24;
    v20 = v24;
    objc_msgSend(v18, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v23, v21, 0.5, 0.5, 1.0, 0.0);

  }
}

void __40__EKEventGestureController__tapGesture___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

}

uint64_t __40__EKEventGestureController__tapGesture___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_multiSelect:(id)a3
{
  EKEventGestureControllerUntimedDelegate **p_untimedDelegate;
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;

  p_untimedDelegate = &self->_untimedDelegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_untimedDelegate);

  if (!WeakRetained)
  {
    v15 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v15, "touchTrackingViewForEventGestureController:", self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInView:", v16);
    v18 = v17;
    v20 = v19;

    objc_msgSend(v15, "eventGestureController:occurrenceViewAtPoint:ignoreSelectedCopyView:", self, 0, v18, v20);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    -[EKEventGestureController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "occurrence");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "eventGestureController:didSingleTapOccurrence:shouldExtendSelection:", self, v21, 1);

    goto LABEL_5;
  }
  v7 = objc_loadWeakRetained((id *)p_untimedDelegate);
  -[EKEventGestureController _viewForTracking](self, "_viewForTracking");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  objc_msgSend(v7, "eventGestureController:eventToStartInteractionWithAtPoint:", self, v10, v12);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  v13 = v22;
  if (v22)
  {
    v14 = objc_loadWeakRetained((id *)p_untimedDelegate);
    objc_msgSend(v14, "eventGestureController:toggleSelectionOfEvent:", self, v22);
LABEL_5:

    v13 = v22;
  }

}

- (void)_longPress:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  char v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  id v15;
  int currentDraggingState;
  unsigned int v17;
  id v18;

  v18 = a3;
  if (!-[EKEventGestureController _shouldUseSystemAPIForDrag](self, "_shouldUseSystemAPIForDrag")
    || self->_currentDraggingState == 2 && (v4 = objc_loadWeakRetained((id *)&self->_delegate), v4, v4))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained
      && (v6 = WeakRetained,
          v7 = objc_loadWeakRetained((id *)&self->_delegate),
          v8 = objc_opt_respondsToSelector(),
          v7,
          v6,
          (v8 & 1) != 0))
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      v10 = objc_msgSend(v9, "eventGestureControllerShouldAllowLongPress:", self);

      if ((v10 & 1) == 0)
        goto LABEL_20;
    }
    else
    {
      v11 = objc_loadWeakRetained((id *)&self->_untimedDelegate);

      if (v11)
      {
        v12 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
        v13 = objc_msgSend(v12, "eventGestureControllerShouldAllowLongPress:", self);

        if (!v13)
          goto LABEL_20;
      }
    }
    -[EKEventGestureController _viewForTracking](self, "_viewForTracking");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "state") == 1
      && (v15 = objc_loadWeakRetained((id *)&self->_delegate)) != 0
      && (currentDraggingState = self->_currentDraggingState, v15, currentDraggingState == 2))
    {
      objc_msgSend(v18, "locationInView:", self->_draggingView);
      v17 = -[EKDayOccurrenceView dragTypeFromPoint:](self->_draggingView, "dragTypeFromPoint:") & 0xFFFFFFFD;
      objc_msgSend(v18, "locationInView:", v14);
      if (v17)
      {
        -[EKEventGestureController _setTouchOffsetsFromPoint:fixedToCenter:](self, "_setTouchOffsetsFromPoint:fixedToCenter:", 0);
      }
      else
      {
        -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 3, 0);
        -[EKEventGestureController _updateFlingToCancelParameters](self, "_updateFlingToCancelParameters");
        self->_waitingForDragToInitialize = 0;
      }
    }
    else if (!-[EKEventGestureController _shouldUseSystemAPIForDrag](self, "_shouldUseSystemAPIForDrag")
           && (self->_currentDraggingState & 0xFFFFFFFE) == 2)
    {
      -[EKEventGestureController _handleLongPressResponseForOldAPI:](self, "_handleLongPressResponseForOldAPI:", v18);
    }

  }
LABEL_20:

}

- (BOOL)_useNewDragAndDropAPI
{
  return 1;
}

- (BOOL)_shouldUseSystemAPIForDrag
{
  return (self->_currentDragType | 2) != 2
      && -[EKEventGestureController _useNewDragAndDropAPI](self, "_useNewDragAndDropAPI");
}

- (void)_handleLongPressResponseForOldAPI:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  id WeakRetained;
  id v13;
  id v14;
  id v15;

  v15 = a3;
  -[EKEventGestureController _viewForTracking](self, "_viewForTracking");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locationInView:", v4);
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v15, "state");
  if ((unint64_t)(v9 - 4) < 2)
  {
    -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 4, self->_event, v6, v8);
    goto LABEL_7;
  }
  if (v9 == 3)
  {
LABEL_7:
    -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 2, self->_event, v6, v8);
    goto LABEL_8;
  }
  if (v9 == 2)
  {
    -[EKEventGestureController _installScrollTimer](self, "_installScrollTimer");
    self->_previousTouchPoint = self->_latestTouchPoint;
    objc_msgSend(v15, "locationInView:", v4);
    self->_latestTouchPoint.x = v10;
    self->_latestTouchPoint.y = v11;
    WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

    if (WeakRetained)
    {
      v13 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
      objc_msgSend(v13, "eventGestureController:updateToPoint:", self, self->_latestTouchPoint.x, self->_latestTouchPoint.y);

    }
    else
    {
      v14 = objc_loadWeakRetained((id *)&self->_delegate);

      if (v14)
        -[EKEventGestureController _update](self, "_update");
    }
  }
LABEL_8:
  -[EKEventGestureController _updateFlingToCancelParameters](self, "_updateFlingToCancelParameters");

}

- (void)_commitUntimed
{
  id WeakRetained;

  if (-[EKEventGestureController commitBlocked](self, "commitBlocked"))
  {
    self->_needsCommit = 1;
  }
  else
  {
    self->_needsCommit = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);
    objc_msgSend(WeakRetained, "eventGestureController:commitToPoint:", self, self->_latestTouchPoint.x, self->_latestTouchPoint.y);

  }
}

- (void)setCommitBlocked:(BOOL)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  EKDayOccurrenceView *draggingView;
  EKEvent *event;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  EKDayOccurrenceView *v14;
  int v15;
  EKDayOccurrenceView *v16;
  __int16 v17;
  EKEvent *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_commitBlocked != a3)
  {
    self->_commitBlocked = a3;
    if (!a3 && self->_needsCommit)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

      if (WeakRetained)
      {
        -[EKEventGestureController _commitUntimed](self, "_commitUntimed");
      }
      else
      {
        v5 = objc_loadWeakRetained((id *)&self->_delegate);

        if (v5)
        {
          v6 = (void *)kEKUILogHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
          {
            draggingView = self->_draggingView;
            event = self->_event;
            v9 = v6;
            v10 = objc_loadWeakRetained((id *)&self->_delegate);
            v15 = 138412802;
            v16 = draggingView;
            v17 = 2112;
            v18 = event;
            v19 = 2112;
            v20 = v10;
            _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_INFO, "Delaying event gesture commit: view = %@ event = %@ delegate = %@", (uint8_t *)&v15, 0x20u);

          }
          v11 = (void *)kEKUILogHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
          {
            v12 = (void *)MEMORY[0x1E0CB3978];
            v13 = v11;
            objc_msgSend(v12, "callStackSymbols");
            v14 = (EKDayOccurrenceView *)objc_claimAutoreleasedReturnValue();
            v15 = 138412290;
            v16 = v14;
            _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_INFO, "Callstack: %@", (uint8_t *)&v15, 0xCu);

          }
          -[EKEventGestureController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__commit, 0, 0);
        }
      }
    }
  }
}

- (void)_installScrollTimer
{
  NSTimer *v3;
  NSTimer *scrollTimer;
  void *v5;

  if (!-[EKEventGestureController _shouldUseSystemAPIForDrag](self, "_shouldUseSystemAPIForDrag")
    && !self->_scrollTimer)
  {
    self->_timeSinceEnteredPageMargin = -1.0;
    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__scrollTimerFired_, 0, 1, 0.0333333333);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    scrollTimer = self->_scrollTimer;
    self->_scrollTimer = v3;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addTimer:forMode:", self->_scrollTimer, *MEMORY[0x1E0C99748]);

    self->_firstContactOfDraggingViewTop = -1.0;
    self->_hasStartedScrolling = 0;
  }
}

- (void)_removeScrollTimer
{
  NSTimer *scrollTimer;

  -[NSTimer invalidate](self->_scrollTimer, "invalidate");
  scrollTimer = self->_scrollTimer;
  self->_scrollTimer = 0;

  self->_timeSinceEnteredPageMargin = 0.0;
  self->_consecutivePageTurnCount = 0;
}

- (void)_scrollTimerFired:(id)a3
{
  EKEventGestureControllerUntimedDelegate **p_untimedDelegate;
  id WeakRetained;
  id v6;
  char v7;
  id v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  id v14;
  char v15;
  double v16;
  id v17;
  double v18;
  double v19;
  _BOOL4 v20;
  double x;
  id v22;
  char v23;
  id v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  id v34;
  char v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _BOOL4 v41;
  _BOOL4 v42;
  double timeSinceEnteredPageMargin;
  double v44;
  int currentDragType;
  int64_t consecutivePageTurnCount;
  _BOOL4 v48;
  uint64_t v49;
  uint64_t v50;
  float v51;
  BOOL v52;
  BOOL v53;
  id v54;
  int v55;
  double v56;
  id v57;
  void *v58;
  void *v59;
  double v60;
  id v61;
  double v62;
  double v63;
  CGFloat firstContactOfDraggingViewTop;
  double v65;
  id v66;
  int v67;
  double v68;
  double y;
  double v70;
  double v71;
  id v72;
  CGRect v73;

  p_untimedDelegate = &self->_untimedDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (WeakRetained)
  {
    v72 = objc_loadWeakRetained((id *)p_untimedDelegate);
    objc_msgSend(v72, "eventGestureControllerScrollTimerFired:", self);
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "pageChangeMarginsForEventGestureController:", self);
      v10 = v9;
      v68 = v11;

    }
    else
    {
      v10 = 44.0;
      v68 = 44.0;
    }
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "touchTrackingViewForEventGestureController:", self);
    v72 = (id)objc_claimAutoreleasedReturnValue();

    y = self->_firstTouchPoint.y;
    v70 = self->_latestTouchPoint.y;
    v13 = self->_latestTouchPoint.x - self->_firstTouchPoint.x;
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = objc_opt_respondsToSelector();

    v16 = 0.0;
    if ((v15 & 1) != 0)
    {
      v17 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v17, "horizontalOffsetForPagingForEventGestureController:", self);
      v16 = v18;

    }
    v71 = v13;
    v19 = fabs(v13);
    v20 = v19 > v16 && v16 > 0.0;
    x = self->_latestTouchPoint.x;
    v22 = objc_loadWeakRetained((id *)&self->_delegate);
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      v24 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v24, "eventGestureController:convertXForMargin:", self, x);
      x = v25;

    }
    objc_msgSend(v72, "frame");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v34 = objc_loadWeakRetained((id *)&self->_delegate);
    v35 = objc_opt_respondsToSelector();

    if ((v35 & 1) != 0)
    {
      v36 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v36, "marginFrameForEventGestureController:", self);
      v27 = v37;
      v29 = v38;
      v31 = v39;
      v33 = v40;

    }
    if (v10 <= 0.0)
    {
      v41 = 0;
    }
    else if (x >= v10)
    {
      v73.origin.x = v27;
      v73.origin.y = v29;
      v73.size.width = v31;
      v73.size.height = v33;
      v41 = x > CGRectGetMaxX(v73) - v68;
    }
    else
    {
      v41 = 1;
    }
    v42 = v19 > 6.0 && v41;
    if (v20 || v42)
    {
      timeSinceEnteredPageMargin = self->_timeSinceEnteredPageMargin;
      if (timeSinceEnteredPageMargin == -1.0)
      {
        self->_timeSinceEnteredPageMargin = 0.8;
        v44 = 0.8;
      }
      else
      {
        v44 = timeSinceEnteredPageMargin + 0.0333333333;
        self->_timeSinceEnteredPageMargin = v44;
      }
    }
    else
    {
      self->_timeSinceEnteredPageMargin = -1.0;
      self->_consecutivePageTurnCount = 0;
      v44 = -1.0;
    }
    currentDragType = self->_currentDragType;
    if (currentDragType != 1)
      goto LABEL_45;
    if (v44 > 0.8)
    {
      consecutivePageTurnCount = self->_consecutivePageTurnCount;
      if (consecutivePageTurnCount < 2 && v41)
        goto LABEL_38;
    }
    if (v44 <= 0.6)
      goto LABEL_45;
    consecutivePageTurnCount = self->_consecutivePageTurnCount;
    if (consecutivePageTurnCount <= 1)
      v41 = 0;
    if (v41)
    {
LABEL_38:
      v48 = v71 < 0.0 - v16 && v20;
      v49 = x < v10 || v48;
      v50 = v49 ^ 1;
      self->_timeSinceEnteredPageMargin = 0.0;
      self->_consecutivePageTurnCount = consecutivePageTurnCount + 1;
    }
    else
    {
LABEL_45:
      v50 = 0;
      v49 = 0;
    }
    if (self->_hasStartedScrolling || (v51 = (v70 - y) * (v70 - y) + v71 * v71, sqrtf(v51) >= 3.0))
    {
      if (currentDragType == 2)
        v53 = self->_latestTouchPoint.y <= self->_firstTouchPoint.y;
      else
        v53 = !currentDragType && self->_latestTouchPoint.y >= self->_firstTouchPoint.y;
      v54 = objc_loadWeakRetained((id *)&self->_delegate);
      v55 = objc_msgSend(v54, "eventGestureController:isAllDayAtPoint:requireInsistence:", self, -[EKDayOccurrenceView isAllDay](self->_draggingView, "isAllDay") ^ 1, self->_latestTouchPoint.x, self->_latestTouchPoint.y);

      v52 = !v53;
      if (!v53 && v55)
        v52 = self->_currentDragType != 1;
    }
    else
    {
      v52 = 0;
    }
    if (((v49 | v50) & 1) != 0 || v52)
    {
      v56 = self->_latestTouchPoint.y;
      if (self->_currentDragType == 1 && self->_previousTouchPoint.y > v56)
      {
        v57 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v57, "touchTrackingViewForEventGestureController:", self);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        -[EKDayOccurrenceView superview](self->_draggingView, "superview");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKDayOccurrenceView frame](self->_draggingView, "frame");
        objc_msgSend(v59, "convertRect:toView:", v58);
        v56 = v60;

        v61 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v61, "timedRegionOriginForEventGestureController:", self);
        v63 = v62;

        if (v56 < v63)
        {
          firstContactOfDraggingViewTop = self->_firstContactOfDraggingViewTop;
          if (firstContactOfDraggingViewTop < 0.0)
          {
            firstContactOfDraggingViewTop = v63;
            if (self->_previousTouchPoint.y - self->_touchOffset.y >= 0.0)
              firstContactOfDraggingViewTop = self->_latestTouchPoint.y;
            self->_firstContactOfDraggingViewTop = firstContactOfDraggingViewTop;
          }
          v56 = v63 + self->_latestTouchPoint.y - firstContactOfDraggingViewTop;
        }
        v65 = self->_latestTouchPoint.x;

      }
      else
      {
        v65 = self->_latestTouchPoint.x;
      }
      v66 = objc_loadWeakRetained((id *)&self->_delegate);
      v67 = objc_msgSend(v66, "didScrollWhenEventGestureController:scrollTimerFiredToMoveLeft:right:vertically:towardPoint:", self, v49, v50, v52, v65, v56);

      if (v67)
      {
        self->_hasStartedScrolling = 1;
        -[EKEventGestureController _update](self, "_update");
      }
    }
  }

}

- (BOOL)_setDraggingState:(int)a3 withPoint:(CGPoint)a4 event:(id)a5
{
  return -[EKEventGestureController _setDraggingState:withPoint:event:context:](self, "_setDraggingState:withPoint:event:context:", *(_QWORD *)&a3, a5, 0, a4.x, a4.y);
}

- (BOOL)_setDraggingState:(int)a3 withPoint:(CGPoint)a4 event:(id)a5 context:(id)a6
{
  double y;
  double x;
  uint64_t v9;
  id v11;
  id v12;
  int currentDraggingState;
  BOOL v14;
  id v15;
  id v16;
  EKEvent *v17;
  EKEvent *v18;
  id WeakRetained;
  id v20;
  EKEvent *v21;
  EKEvent *event;
  int v23;
  id v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t queuedDraggingState;
  id v38;
  int v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  y = a4.y;
  x = a4.x;
  v9 = *(_QWORD *)&a3;
  v43 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  currentDraggingState = self->_currentDraggingState;
  if (currentDraggingState == (_DWORD)v9)
  {
    v14 = 1;
    goto LABEL_44;
  }
  if (self->_pendingDraggingState != -1)
  {
    v14 = 0;
    self->_queuedDraggingState = v9;
    goto LABEL_44;
  }
  self->_pendingDraggingState = v9;
  switch((int)v9)
  {
    case 0:
      if (self->_forcedStart)
      {
        -[EKEventGestureController _cleanUpForcedStart](self, "_cleanUpForcedStart");
        currentDraggingState = self->_currentDraggingState;
      }
      if (currentDraggingState == 1 || currentDraggingState == 2)
      {
        -[EKEventGestureController _cleanUpAllStateWithTouchPoint:commit:](self, "_cleanUpAllStateWithTouchPoint:commit:", 0, x, y);
        goto LABEL_38;
      }
      -[EKEventGestureController _cleanUpAllStateWithTouchPoint:commit:](self, "_cleanUpAllStateWithTouchPoint:commit:", 0, x, y);
      -[EKEventGestureController _manageDraggingViewInteractivityForStateChangeFrom:to:](self, "_manageDraggingViewInteractivityForStateChangeFrom:to:", self->_currentDraggingState, 0);
      v30 = (void *)kEKUILogHandle;
      v14 = 0;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        v31 = self->_currentDraggingState;
        v32 = v30;
        -[EKEventGestureController _debugStringForDraggingState:](self, "_debugStringForDraggingState:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEventGestureController _debugStringForDraggingState:](self, "_debugStringForDraggingState:", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138412546;
        v40 = v33;
        v41 = 2112;
        v42 = v34;
        _os_log_impl(&dword_1AF84D000, v32, OS_LOG_TYPE_ERROR, "Invalid dragging state transition requested, but executed anyway: [%@] -> [%@]", (uint8_t *)&v39, 0x16u);

        v14 = 0;
      }
      goto LABEL_41;
    case 1:
      if (currentDraggingState)
        goto LABEL_28;
      -[EKEventGestureController _setUpInitialTouchPointsWithPoint:](self, "_setUpInitialTouchPointsWithPoint:", x, y);
      WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

      if (WeakRetained)
      {
        v20 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
        objc_msgSend(v20, "eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:", self, v11, 1, x, y);
        v21 = (EKEvent *)objc_claimAutoreleasedReturnValue();
        event = self->_event;
        self->_event = v21;

        v23 = -[EKEvent isNew](self->_event, "isNew");
        if (v12 && v23 && objc_msgSend(v12, "isManaged"))
        {
          -[EKEventGestureController _setEventCalendar:useManagedCalendar:](self, "_setEventCalendar:useManagedCalendar:", self->_event, 1);
          v24 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
          objc_msgSend(v24, "eventGestureControllerRequestsUpdateOfDraggingView:", self);

        }
      }
      else
      {
        v35 = objc_loadWeakRetained((id *)&self->_delegate);

        if (v35)
          -[EKEventGestureController _createAndSetUpDraggingViewWithTouchPoint:event:ignoreOffsets:showEditMenu:](self, "_createAndSetUpDraggingViewWithTouchPoint:event:ignoreOffsets:showEditMenu:", v11, 1, 0, x, y);
      }
      goto LABEL_38;
    case 2:
      switch(currentDraggingState)
      {
        case 0:
          -[EKEventGestureController _beginEditingSessionAtPoint:withEvent:](self, "_beginEditingSessionAtPoint:withEvent:", v11, x, y);
          if (!self->_draggingView)
          {
            v15 = objc_loadWeakRetained((id *)&self->_untimedDelegate);

            if (v15)
            {
              v16 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
              objc_msgSend(v16, "eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:", self, v11, 0, x, y);
              v17 = (EKEvent *)objc_claimAutoreleasedReturnValue();
              v18 = self->_event;
              self->_event = v17;

            }
            else
            {
              v38 = objc_loadWeakRetained((id *)&self->_delegate);

              if (v38)
                -[EKEventGestureController _createAndSetUpDraggingViewWithTouchPoint:event:ignoreOffsets:showEditMenu:](self, "_createAndSetUpDraggingViewWithTouchPoint:event:ignoreOffsets:showEditMenu:", v11, 1, 1, x, y);
            }
          }
          break;
        case 1:
          -[EKEventGestureController _beginEditingSessionAtPoint:withEvent:](self, "_beginEditingSessionAtPoint:withEvent:", v11, x, y);
          break;
        case 3:
          break;
        case 4:
          -[EKEventGestureController _returnDraggingViewToLastCommittedPositionFromTouchPoint:](self, "_returnDraggingViewToLastCommittedPositionFromTouchPoint:", x, y);
          goto LABEL_38;
        default:
          goto LABEL_28;
      }
      -[EKEventGestureController _writeDraggingChangesToOccurrenceWithTouchPoint:](self, "_writeDraggingChangesToOccurrenceWithTouchPoint:", x, y);
      goto LABEL_38;
    case 3:
      if (!currentDraggingState || currentDraggingState == 2)
      {
        self->_waitingForDragToInitialize = 1;
        if (-[EKEventGestureController _beginNewDragFromOffStateWithPoint:](self, "_beginNewDragFromOffStateWithPoint:", x, y))
        {
          goto LABEL_38;
        }
LABEL_28:
        v25 = (void *)kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          v26 = self->_currentDraggingState;
          v27 = v25;
          -[EKEventGestureController _debugStringForDraggingState:](self, "_debugStringForDraggingState:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKEventGestureController _debugStringForDraggingState:](self, "_debugStringForDraggingState:", v9);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 138412546;
          v40 = v28;
          v41 = 2112;
          v42 = v29;
          _os_log_impl(&dword_1AF84D000, v27, OS_LOG_TYPE_ERROR, "Dragging state transition requested, but refused: [%@] -> [%@]", (uint8_t *)&v39, 0x16u);

        }
        v14 = 0;
        goto LABEL_42;
      }
      if (currentDraggingState != 4)
        goto LABEL_28;
      -[EKEventGestureController _resumePreviousDrag](self, "_resumePreviousDrag");
LABEL_38:
      if (!self->_dragInteractionCancellingWithoutDragging)
        -[EKEventGestureController _manageFeedbackForStateChangeFrom:to:](self, "_manageFeedbackForStateChangeFrom:to:", self->_currentDraggingState, v9);
      -[EKEventGestureController _manageDraggingViewInteractivityForStateChangeFrom:to:](self, "_manageDraggingViewInteractivityForStateChangeFrom:to:", self->_currentDraggingState, v9);
      v14 = 1;
LABEL_41:
      self->_currentDraggingState = v9;
LABEL_42:
      self->_pendingDraggingState = -1;
      queuedDraggingState = self->_queuedDraggingState;
      if ((_DWORD)queuedDraggingState != -1)
      {
        self->_queuedDraggingState = -1;
        v14 = -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", queuedDraggingState, v11, x, y);
      }
LABEL_44:

      return v14;
    case 4:
      if (currentDraggingState != 3)
        goto LABEL_28;
      -[EKEventGestureController _suspendCurrentDrag](self, "_suspendCurrentDrag");
      goto LABEL_38;
    default:
      goto LABEL_28;
  }
}

- (int)_draggingState
{
  return self->_currentDraggingState;
}

- (id)_debugStringForDraggingState:(int)a3
{
  if (a3 < 5)
    return *((id *)&off_1E601CD00 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dragging state UNKNOWN (%d)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_manageFeedbackForStateChangeFrom:(int)a3 to:(int)a4
{
  _UIDragSnappingFeedbackGenerator *v5;
  _UIDragSnappingFeedbackGenerator *v6;
  _UIDragSnappingFeedbackGenerator *v7;
  _UIDragSnappingFeedbackGenerator *v8;
  _UIDragSnappingFeedbackGenerator *dragSnappingFeedback;

  if ((a3 & 0xFFFFFFFD) != 0 || a4 != 3)
  {
    if ((a3 & 0xFFFFFFFD) == 1 && a4 == 2)
    {
      -[_UIDragSnappingFeedbackGenerator draggedObjectLanded](self->_dragSnappingFeedback, "draggedObjectLanded");
      -[_UIDragSnappingFeedbackGenerator userInteractionEnded](self->_dragSnappingFeedback, "userInteractionEnded");
      dragSnappingFeedback = self->_dragSnappingFeedback;
      self->_dragSnappingFeedback = 0;

    }
  }
  else
  {
    v5 = self->_dragSnappingFeedback;
    if (v5)
    {
      -[_UIDragSnappingFeedbackGenerator userInteractionEnded](v5, "userInteractionEnded");
      v6 = self->_dragSnappingFeedback;
      self->_dragSnappingFeedback = 0;

    }
    v7 = (_UIDragSnappingFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4110]), "initWithView:", self->_draggingView);
    v8 = self->_dragSnappingFeedback;
    self->_dragSnappingFeedback = v7;

    -[_UIDragSnappingFeedbackGenerator userInteractionStarted](self->_dragSnappingFeedback, "userInteractionStarted");
    -[_UIDragSnappingFeedbackGenerator draggedObjectLifted](self->_dragSnappingFeedback, "draggedObjectLifted");
  }
}

- (void)didCrossDragBoundary:(int)a3
{
  if (a3 == 2)
    -[_UIDragSnappingFeedbackGenerator dropTargetUpdated](self->_dragSnappingFeedback, "dropTargetUpdated");
}

- (void)_manageDraggingViewInteractivityForStateChangeFrom:(int)a3 to:(int)a4
{
  -[EKDayOccurrenceView setUserInteractionEnabled:](self->_draggingView, "setUserInteractionEnabled:", (a4 > 4) | (5u >> a4) & 1);
}

- (BOOL)_beginNewDragFromOffStateWithPoint:(CGPoint)a3
{
  double y;
  double x;
  BOOL v6;
  id WeakRetained;
  void *v8;
  EKEvent *v9;
  EKEvent *event;
  id v11;

  y = a3.y;
  x = a3.x;
  -[EKEventGestureController _setUpInitialTouchPointsWithPoint:](self, "_setUpInitialTouchPointsWithPoint:");
  if (!self->_forcedStart)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

    if (WeakRetained)
    {
      v6 = 1;
      self->_currentDragType = 1;
      v8 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
      objc_msgSend(v8, "eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:", self, 0, 0, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
      v9 = (EKEvent *)objc_claimAutoreleasedReturnValue();
      event = self->_event;
      self->_event = v9;

    }
    else
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);

      if (!v11)
        goto LABEL_3;
      -[EKEventGestureController _createNewEventIfNeededAtPoint:](self, "_createNewEventIfNeededAtPoint:", x, y);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventGestureController _createAndSetUpDraggingViewWithTouchPoint:event:ignoreOffsets:showEditMenu:](self, "_createAndSetUpDraggingViewWithTouchPoint:event:ignoreOffsets:showEditMenu:", v8, 0, 1, x, y);
      v6 = -[EKEventGestureController _beginEditingSessionAtPoint:withEvent:](self, "_beginEditingSessionAtPoint:withEvent:", v8, x, y);
    }

    goto LABEL_9;
  }
  -[EKEventGestureController _setUpAfterForcedStartFromPoint:](self, "_setUpAfterForcedStartFromPoint:", self->_latestTouchPoint.x, self->_latestTouchPoint.y);
LABEL_3:
  v6 = 1;
LABEL_9:
  -[EKEventGestureController _updateFlingToCancelParameters](self, "_updateFlingToCancelParameters");
  return v6;
}

- (void)_setUpInitialTouchPointsWithPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint latestTouchPoint;

  y = a3.y;
  x = a3.x;
  self->_firstTouchTime = CFAbsoluteTimeGetCurrent();
  self->_latestTouchPoint.x = x;
  self->_latestTouchPoint.y = y;
  latestTouchPoint = self->_latestTouchPoint;
  self->_previousTouchPoint = latestTouchPoint;
  self->_firstTouchPoint = latestTouchPoint;
  self->_dragLockDisabled = !-[EKEventGestureController usesHorizontalDragLocking](self, "usesHorizontalDragLocking");
  self->_isDragging = 1;
  -[EKEventGestureController _updateSnappingTypeForCurrentDrag](self, "_updateSnappingTypeForCurrentDrag");
}

- (void)_cleanUpAllStateWithTouchPoint:(CGPoint)a3 commit:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat y;
  CGFloat x;
  EKEvent *event;
  id WeakRetained;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[EKEventGestureController _removeScrollTimer](self, "_removeScrollTimer");
  self->_isDragging = 0;
  self->_latestTouchPoint.x = x;
  self->_latestTouchPoint.y = y;
  self->_needToSetSystemDragPreview = 0;
  self->_snappingTypeForCurrentDrag = 0;
  event = self->_event;
  self->_event = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);
  if (!v4)
  {
    if (WeakRetained)
    {
      v10 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
      objc_msgSend(v10, "eventGestureControllerCancelled:", self);
    }
    else
    {
      v12 = objc_loadWeakRetained((id *)&self->_delegate);

      if (!v12)
        goto LABEL_12;
      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0)
        goto LABEL_12;
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "eventGestureControllerDidEndDragSession:", self);
    }

    goto LABEL_12;
  }
  if (WeakRetained)
  {
    -[EKEventGestureController _commitUntimed](self, "_commitUntimed");
  }
  else
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v11)
      -[EKEventGestureController _commit](self, "_commit");
  }
LABEL_12:
  -[EKEventGestureController removeDraggedOccurrence](self, "removeDraggedOccurrence");
}

- (id)_createNewEventIfNeededAtPoint:(CGPoint)a3
{
  double y;
  double x;
  EKEventGestureControllerDelegate **p_delegate;
  id WeakRetained;
  void *v8;
  EKEvent *event;
  void *v10;
  EKEvent *v11;
  id v13;
  id v14;

  y = a3.y;
  x = a3.x;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "eventGestureController:occurrenceViewAtPoint:ignoreSelectedCopyView:", self, 1, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventGestureController setDraggingViewSource:](self, "setDraggingViewSource:", v8);

  event = self->_event;
  if (!event)
  {
    -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v13 = objc_loadWeakRetained((id *)p_delegate);
      v11 = (EKEvent *)objc_msgSend(v13, "createEventForEventGestureController:", self);

      v14 = objc_loadWeakRetained((id *)p_delegate);
      -[EKEvent setAllDay:](v11, "setAllDay:", objc_msgSend(v14, "eventGestureController:isAllDayAtPoint:requireInsistence:", self, 0, self->_firstTouchPoint.x, self->_firstTouchPoint.y));

      -[EKEventGestureController _adjustNewEventDates:withPoint:](self, "_adjustNewEventDates:withPoint:", v11, x, y);
      self->_isNewEvent = -[EKEvent isNew](v11, "isNew");
      return v11;
    }
    event = self->_event;
  }
  self->_isNewEvent = -[EKEvent isNew](event, "isNew");
  v11 = self->_event;
  return v11;
}

- (void)_adjustNewEventDates:(id)a3 withPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id WeakRetained;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = 1.0;
  if ((objc_msgSend(v7, "isAllDay") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D0C2F8], "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultEventDuration");
    v8 = v10;

  }
  -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", v7, objc_msgSend(v7, "isAllDay"), v8);
  v12 = y + v11 * -0.5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(v7, "isAllDay"))
    v14 = y;
  else
    v14 = v12;
  objc_msgSend(WeakRetained, "eventGestureController:dateAtPoint:", self, x, v14);
  v16 = v15;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v16);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStartDate:", v18);
  objc_msgSend(v18, "dateByAddingTimeInterval:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEndDateUnadjustedForLegacyClients:", v17);

}

- (void)_createAndSetUpDraggingViewWithTouchPoint:(CGPoint)a3 event:(id)a4 ignoreOffsets:(BOOL)a5 showEditMenu:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  double y;
  double x;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  EKDayOccurrenceView *v15;
  EKDayOccurrenceView *draggingView;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  id v45;

  v6 = a6;
  v7 = a5;
  y = a3.y;
  x = a3.x;
  v45 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "eventGestureController:occurrenceViewAtPoint:ignoreSelectedCopyView:", self, 1, x, y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {

    if (v12)
    {
      -[EKEventGestureController setDraggingViewSource:](self, "setDraggingViewSource:", v12);
    }
    else
    {
      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v13, "eventGestureController:occurrenceViewForOccurrence:occurrenceDate:", self, v45, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventGestureController setDraggingViewSource:](self, "setDraggingViewSource:", v14);

    }
  }
  else
  {
    -[EKEventGestureController setDraggingViewSource:](self, "setDraggingViewSource:", v12);

    -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "occurrence");
    v45 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (!self->_draggingView)
  {
    -[EKEventGestureController _createTemporaryView:animated:](self, "_createTemporaryView:animated:", v45, 0);
    v15 = (EKDayOccurrenceView *)objc_claimAutoreleasedReturnValue();
    draggingView = self->_draggingView;
    self->_draggingView = v15;

    if (v6)
      -[EKEventGestureController _updatePositionOfEditingMenuForView:](self, "_updatePositionOfEditingMenuForView:", self->_draggingView);
  }
  -[EKEventGestureController _setTouchOffsetsFromPoint:fixedToCenter:](self, "_setTouchOffsetsFromPoint:fixedToCenter:", v7, x, y);
  -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "occurrence");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "travelTimeSubviewHeightInPoints");
    -[EKDayOccurrenceView setTravelTimeSubviewHeightInPoints:](self->_draggingView, "setTravelTimeSubviewHeightInPoints:");

    -[EKDayOccurrenceView frame](self->_draggingView, "frame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    v28 = v27;

    if (self->_pendingDraggingState != 1)
    {
      -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "superview");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "frame");
      v33 = v32;
      v35 = v34;
      -[EKDayOccurrenceView superview](self->_draggingView, "superview");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "convertPoint:toView:", v36, v33, v35);
      v23 = v37;

    }
LABEL_16:
    -[EKDayOccurrenceView setFrame:](self->_draggingView, "setFrame:", v21, v23, v25, v28);
    goto LABEL_17;
  }
  if ((objc_msgSend(v45, "isAllDay") & 1) == 0)
  {
    objc_msgSend(v45, "travelTime");
    if (v38 > 0.01)
    {
      objc_msgSend(v45, "travelTime");
      -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", 0, 0);
      -[EKDayOccurrenceView setTravelTimeSubviewHeightInPoints:](self->_draggingView, "setTravelTimeSubviewHeightInPoints:");
    }
    objc_msgSend(v45, "duration");
    -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", 0, 0);
    v40 = v39;
    -[EKDayOccurrenceView frame](self->_draggingView, "frame");
    v21 = v41;
    v23 = v42;
    v25 = v43;
    -[EKDayOccurrenceView travelTimeSubviewHeightInPoints](self->_draggingView, "travelTimeSubviewHeightInPoints");
    v28 = v40 + v44;
    goto LABEL_16;
  }
LABEL_17:
  -[EKEventGestureController _animateInNewEvent](self, "_animateInNewEvent");
  if (!self->_isNewEvent && (!self->_isMultiDayTimedEvent || !self->_touchOffsetDays))
    -[EKDayOccurrenceView setDrawsResizeHandles:](self->_draggingView, "setDrawsResizeHandles:", 1);

}

- (BOOL)_beginEditingSessionAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id WeakRetained;
  id v9;
  EKEvent *v10;
  EKEvent *event;
  BOOL v12;
  id v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!self->_currentDraggingState)
    -[EKEventGestureController _setUpInitialTouchPointsWithPoint:](self, "_setUpInitialTouchPointsWithPoint:", x, y);
  WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (WeakRetained)
  {
    if (self->_currentDraggingState != 1)
    {
      v9 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
      objc_msgSend(v9, "eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:", self, v7, 0, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
      v10 = (EKEvent *)objc_claimAutoreleasedReturnValue();
      event = self->_event;
      self->_event = v10;

    }
    v12 = 1;
  }
  else
  {
    v13 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v13)
      v12 = -[EKEventGestureController __timedDelegateBeginEditingSessionAtPoint:withEvent:](self, "__timedDelegateBeginEditingSessionAtPoint:withEvent:", v7, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
    else
      v12 = 0;
  }

  return v12;
}

- (BOOL)canProposeNewTime:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "allowsProposedTimeModifications"))
  {
    if ((objc_msgSend(v3, "serverSupportedProposeNewTime") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v3, "organizer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = +[EKUIEmailCompositionManager canShowViewControllerForEvent:withParticipantRecipients:](EKUIEmailCompositionManager, "canShowViewControllerForEvent:withParticipantRecipients:", v3, v6);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)__timedDelegateBeginEditingSessionAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  int v15;
  void *v16;
  BOOL v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  EKCalendarDate *currentDay;
  void *v30;
  uint64_t v31;
  int64_t *p_commitOffsetDays;
  id v33;
  void *v34;
  double v35;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  self->_currentDragType = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "eventGestureController:occurrenceViewAtPoint:ignoreSelectedCopyView:", self, 1, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

    if (v9)
    {
      -[EKEventGestureController setDraggingViewSource:](self, "setDraggingViewSource:", v9);
    }
    else
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "eventGestureController:occurrenceViewForOccurrence:occurrenceDate:", self, v7, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventGestureController setDraggingViewSource:](self, "setDraggingViewSource:", v11);

    }
  }
  else
  {
    -[EKEventGestureController setDraggingViewSource:](self, "setDraggingViewSource:", v9);

    v9 = WeakRetained;
  }

  -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "occurrence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_11;
  v14 = -[EKEventGestureController canProposeNewTime:](self, "canProposeNewTime:", v13);
  v15 = objc_msgSend(v13, "isEditable") | v14;
  if (!objc_msgSend(v13, "isReminderIntegrationEvent"))
  {
    if ((v15 & 1) == 0)
      goto LABEL_9;
LABEL_11:
    if (v7)
      goto LABEL_12;
    -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_16;
    -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "occurrence");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
LABEL_12:
      if (!objc_msgSend(v7, "isNew"))
      {
LABEL_31:
        -[EKEventGestureController setEvent:](self, "setEvent:", v7);
        v33 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v7, "startDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "timeIntervalSinceReferenceDate");
        objc_msgSend(v33, "eventGestureController:didSetUpAtDate:isAllDay:", self, -[EKDayOccurrenceView isAllDay](self->_draggingView, "isAllDay"), v35);

        v17 = 1;
        goto LABEL_32;
      }
      v18 = 0;
    }
    else
    {
LABEL_16:
      v18 = 1;
    }
    -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "occurrence");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      self->_isNewEvent = v22 == 0;

    }
    else
    {
      self->_isNewEvent = 1;
    }

    if (v18)
    {
      -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23 == 0;

    }
    else
    {
      v24 = 0;
    }
    -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v26 = objc_loadWeakRetained((id *)&self->_delegate);
      v27 = (void *)objc_msgSend(v26, "createEventForEventGestureController:", self);

      v28 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v27, "setAllDay:", objc_msgSend(v28, "eventGestureController:isAllDayAtPoint:requireInsistence:", self, 0, self->_firstTouchPoint.x, self->_firstTouchPoint.y));

      v7 = v27;
    }
    if (!v25)
    {
      -[EKEventGestureController _adjustNewEventDates:withPoint:](self, "_adjustNewEventDates:withPoint:", v7, x, y);
      if (self->_currentDraggingState != 1)
      {
        currentDay = self->_currentDay;
        objc_msgSend(v7, "startCalendarDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[EKCalendarDate differenceInDays:](currentDay, "differenceInDays:", v30);

        if (-[EKEventGestureController splitMultiDays](self, "splitMultiDays"))
        {
          self->_touchOffsetDays = 0;
          p_commitOffsetDays = &self->_commitOffsetDays;
        }
        else
        {
          p_commitOffsetDays = &self->_touchOffsetDays;
        }
        *p_commitOffsetDays = v31;
      }
    }
    goto LABEL_31;
  }
  if ((objc_msgSend(v13, "CUIK_reminderShouldBeEditable") & v15 & 1) != 0)
    goto LABEL_11;
LABEL_9:
  -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CalPlopViewWithScaleFactorAndCompletion(v16, 0, 1.0);

  -[UILongPressGestureRecognizer setState:](self->_draggingGestureRecognizer, "setState:", 4);
  -[EKEventGestureController _cleanUpAllStateWithTouchPoint:commit:](self, "_cleanUpAllStateWithTouchPoint:commit:", 0, x, y);
  v17 = 0;
LABEL_32:

  return v17;
}

- (void)_writeDraggingChangesToOccurrenceWithTouchPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id WeakRetained;
  id v7;

  y = a3.y;
  x = a3.x;
  -[EKEventGestureController _removeScrollTimer](self, "_removeScrollTimer");
  self->_isDragging = 0;
  self->_latestTouchPoint.x = x;
  self->_latestTouchPoint.y = y;
  self->_needToSetSystemDragPreview = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (WeakRetained)
  {
    -[EKEventGestureController _commitUntimed](self, "_commitUntimed");
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v7)
      -[EKEventGestureController _commit](self, "_commit");
  }
}

- (void)_returnDraggingViewToLastCommittedPositionFromTouchPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id WeakRetained;
  id v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[EKEventGestureController _removeScrollTimer](self, "_removeScrollTimer");
  self->_isDragging = 0;
  self->_latestTouchPoint.x = x;
  self->_latestTouchPoint.y = y;
  self->_needToSetSystemDragPreview = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
    objc_msgSend(v8, "eventGestureControllerCancelled:", self);

  }
  else
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v7)
      -[EKEventGestureController _cancel](self, "_cancel");
  }
}

- (void)_dragFailedToStart
{
  double x;
  double y;
  id WeakRetained;
  id v6;
  char v7;
  id v8;

  x = self->_latestTouchPoint.x;
  y = self->_latestTouchPoint.y;
  if (self->_currentDraggingState)
    -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 0, 0, x, y);
  else
    -[EKEventGestureController _cleanUpAllStateWithTouchPoint:commit:](self, "_cleanUpAllStateWithTouchPoint:commit:", 0, x, y);
  WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
    objc_msgSend(v8, "eventGestureControllerDragFailed:", self);
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
      return;
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "cleanUpAfterGestureFailureForEventGestureController:", self);
  }

}

- (id)_viewForTracking
{
  EKEventGestureControllerUntimedDelegate **p_untimedDelegate;
  id WeakRetained;
  id v5;
  id v6;
  void *v7;

  p_untimedDelegate = &self->_untimedDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (WeakRetained
    || (p_untimedDelegate = &self->_delegate, v5 = objc_loadWeakRetained((id *)&self->_delegate), v5, v5))
  {
    v6 = objc_loadWeakRetained((id *)p_untimedDelegate);
    objc_msgSend(v6, "touchTrackingViewForEventGestureController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_updateFlingToCancelParameters
{
  double Current;
  double v4;

  Current = CFAbsoluteTimeGetCurrent();
  v4 = sqrt((self->_latestTouchPoint.y - self->_previousTouchPoint.y)* (self->_latestTouchPoint.y - self->_previousTouchPoint.y)+ (self->_latestTouchPoint.x - self->_previousTouchPoint.x)* (self->_latestTouchPoint.x - self->_previousTouchPoint.x))/ (Current - self->_previousTouchTime);
  self->_previousTouchTime = Current;
  self->_previousTouchVelocity = v4;
}

- (void)_setEventCalendar:(id)a3 useManagedCalendar:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "eventStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultCalendarForNewEvents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isManaged");

    if (v10)
    {
      objc_msgSend(v8, "defaultCalendarForNewEvents");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v8, "calendarsForEntityType:", 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v20 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            if (-[EKEventGestureController _calendarCanAcceptManagedData:](self, "_calendarCanAcceptManagedData:", v18))
              objc_msgSend(v12, "addObject:", v18);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v15);
      }

      -[EKEventGestureController _findFirstCalendar:](self, "_findFirstCalendar:", v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_16;
    }
    objc_msgSend(v7, "setCalendar:", v11);
LABEL_16:

  }
}

- (id)_findFirstCalendar:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "sortedArrayUsingFunction:context:", MEMORY[0x1E0D0C950], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_calendarCanAcceptManagedData:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (objc_msgSend(v3, "isManaged") && objc_msgSend(v3, "allowsContentModifications"))
    v4 = objc_msgSend(v3, "isSubscribed") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (id)_acceptedTypes
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", CFSTR("com.apple.eventkit.internal"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventGestureController _acceptedExternalTypes](self, "_acceptedExternalTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  return v3;
}

- (id)_acceptedExternalTypes
{
  void *v3;
  void *v4;
  void *v5;

  -[EKEventGestureController _acceptedNonFileExternalTypes](self, "_acceptedNonFileExternalTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventGestureController _acceptedFileExternalTypes](self, "_acceptedFileExternalTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_acceptedNonFileExternalTypes
{
  return +[EventImportData acceptedTypeIdentifiers](EventImportData, "acceptedTypeIdentifiers");
}

- (id)_acceptedFileExternalTypes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend((id)*MEMORY[0x1E0CEC588], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_getEventUsingDropSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "items", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "localObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v9, "localObject");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  -[EKEventGestureController _acceptedExternalTypes](self, "_acceptedExternalTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "hasItemsConformingToTypeIdentifiers:", v12);

  if (!v6 && v13)
  {
    -[EKEventGestureController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[EKEventGestureController _viewForTracking](self, "_viewForTracking");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationInView:", v15);
      v17 = v16;
      v19 = v18;

      -[EKEventGestureController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v20, "createEventForEventGestureController:", self);

      -[EKEventGestureController _adjustNewEventDates:withPoint:](self, "_adjustNewEventDates:withPoint:", v6, v17, v19);
      if (+[EventImportData isSessionManaged:](EventImportData, "isSessionManaged:", v4))
        -[EKEventGestureController _setEventCalendar:useManagedCalendar:](self, "_setEventCalendar:useManagedCalendar:", v6, 1);
    }
    else
    {
      v6 = 0;
    }
    self->_isNewEvent = 1;
  }

  return v6;
}

- (unint64_t)_dropOperationGivenDropSession:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  int v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "items", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "localObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {

          v14 = 3;
          goto LABEL_13;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[EKEventGestureController _acceptedExternalTypes](self, "_acceptedExternalTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "hasItemsConformingToTypeIdentifiers:", v12);

  if (v13)
    v14 = 2;
  else
    v14 = 0;
LABEL_13:

  return v14;
}

- (BOOL)_dropSessionRequiresExternalDataExtraction:(id)a3
{
  return -[EKEventGestureController _dropOperationGivenDropSession:](self, "_dropOperationGivenDropSession:", a3) == 2;
}

- (void)_setupEvent:(id)a3 withImportData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v7);

  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setURL:", v8);

  objc_msgSend(v6, "notes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNotes:", v9);

  -[EKEventGestureController _setEventCalendar:useManagedCalendar:](self, "_setEventCalendar:useManagedCalendar:", v12, objc_msgSend(v6, "prefersManagedCalendar"));
  objc_msgSend(v6, "structuredLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "structuredLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStructuredLocation:", v11);

  }
}

- (void)_handleShowingEventWithUniqueId:(id)a3 date:(id)a4 eventStore:(id)a5
{
  EKEventGestureControllerUntimedDelegate **p_untimedDelegate;
  id WeakRetained;
  id v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  id v13;

  objc_msgSend(a5, "eventWithUniqueId:occurrenceDate:", a3, a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    p_untimedDelegate = &self->_untimedDelegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

    if (WeakRetained
      || (p_untimedDelegate = &self->_delegate, (v9 = objc_loadWeakRetained((id *)&self->_delegate)) != 0)
      && (v10 = v9,
          v11 = objc_loadWeakRetained((id *)&self->_delegate),
          v12 = objc_opt_respondsToSelector(),
          v11,
          v10,
          (v12 & 1) != 0))
    {
      v8 = objc_loadWeakRetained((id *)p_untimedDelegate);
      objc_msgSend(v8, "eventGestureController:requestsShowEvent:", self, v13);

    }
  }

}

- (void)_handleImportingICSData:(id)a3 intoEventStore:(id)a4
{
  id v6;
  EKICSPreviewController *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  v7 = -[EKICSPreviewController initWithData:eventStore:]([EKICSPreviewController alloc], "initWithData:eventStore:", v6, v9);

  -[EKICSPreviewController setAllowsImport:](v7, "setAllowsImport:", 1);
  -[EKICSPreviewController setPreviewDelegate:](v7, "setPreviewDelegate:", self);
  -[EKICSPreviewController setCancelButtonWithTarget:action:](v7, "setCancelButtonWithTarget:action:", self, sel__icsPreviewControllerCancelButtonPressed);
  -[EKICSPreviewController singleExistingEventUniqueID](v7, "singleExistingEventUniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[EKEventGestureController _handleShowingEventWithUniqueId:date:eventStore:](self, "_handleShowingEventWithUniqueId:date:eventStore:", v8, 0, v9);
  }
  else
  {
    objc_storeStrong((id *)&self->_currentICSPreviewController, v7);
    -[EKEventGestureController _presentICSPreviewControllerIfNeeded](self, "_presentICSPreviewControllerIfNeeded");
  }

}

- (void)_presentICSPreviewControllerIfNeeded
{
  EKICSPreviewController *currentICSPreviewController;
  void *v4;
  void *v5;
  void *v6;
  EKEventGestureControllerUntimedDelegate **p_untimedDelegate;
  id WeakRetained;
  id v9;
  void *v10;
  id v11;

  currentICSPreviewController = self->_currentICSPreviewController;
  if (currentICSPreviewController)
  {
    -[EKICSPreviewController viewController](currentICSPreviewController, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      p_untimedDelegate = &self->_untimedDelegate;
      WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

      if (WeakRetained
        || (p_untimedDelegate = &self->_delegate,
            v9 = objc_loadWeakRetained((id *)&self->_delegate),
            v9,
            v9))
      {
        v11 = objc_loadWeakRetained((id *)p_untimedDelegate);
        -[EKICSPreviewController viewController](self->_currentICSPreviewController, "viewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "eventGestureController:requestsPresentationOfViewController:", self, v10);

      }
    }
  }
}

- (void)icsPreviewControllerWantsDismissal:(id)a3
{
  if (self->_currentICSPreviewController == a3)
    -[EKEventGestureController _dismissCurrentICSPreviewControllerAnimated:](self, "_dismissCurrentICSPreviewControllerAnimated:", 1);
}

- (void)icsPreviewControllerImportDidFail:(id)a3
{
  if (self->_currentICSPreviewController == a3)
    -[EKEventGestureController _dismissCurrentICSPreviewControllerAnimated:](self, "_dismissCurrentICSPreviewControllerAnimated:", 1);
}

- (void)icsPreviewControllerImportDidImportEvents:(id)a3
{
  if (self->_currentICSPreviewController == a3)
    -[EKEventGestureController _dismissCurrentICSPreviewControllerAnimated:](self, "_dismissCurrentICSPreviewControllerAnimated:", 1);
}

- (void)_icsPreviewControllerCancelButtonPressed
{
  -[EKEventGestureController _dismissCurrentICSPreviewControllerAnimated:](self, "_dismissCurrentICSPreviewControllerAnimated:", 1);
}

- (void)_dismissCurrentICSPreviewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  EKICSPreviewController *currentICSPreviewController;

  v3 = a3;
  -[EKICSPreviewController viewController](self->_currentICSPreviewController, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", v3, 0);

  currentICSPreviewController = self->_currentICSPreviewController;
  self->_currentICSPreviewController = 0;

}

- (void)attemptDisplayReviewPrompt
{
  EKEventGestureControllerDelegate **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "attemptDisplayReviewPrompt");

  }
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[EKEventGestureController _acceptedTypes](self, "_acceptedTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hasItemsConformingToTypeIdentifiers:", v6);

  return v7;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v6;
  id v7;
  int currentDraggingState;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  DraggingContext *v15;
  void *v16;
  NSObject *v17;
  BOOL v18;
  EKEventGestureController *v19;
  uint64_t v20;
  uint8_t v21[16];

  v6 = a3;
  v7 = a4;
  self->_waitingForDragToInitialize = 0;
  currentDraggingState = self->_currentDraggingState;
  if (currentDraggingState == 4)
  {
    -[EKEventGestureController _viewForTracking](self, "_viewForTracking");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v16);
    -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 3, self->_event);
    -[EKEventGestureController _updateFlingToCancelParameters](self, "_updateFlingToCancelParameters");

    goto LABEL_12;
  }
  if (currentDraggingState)
    goto LABEL_12;
  if ((-[EKEventGestureController _dropOperationGivenDropSession:](self, "_dropOperationGivenDropSession:", v7) & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v17 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1AF84D000, v17, OS_LOG_TYPE_ERROR, "Received view:draggingEntered:, but no event data available to be extracted. Not starting drag.", v21, 2u);
    }
    goto LABEL_12;
  }
  -[EKEventGestureController _getEventUsingDropSession:](self, "_getEventUsingDropSession:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventGestureController _viewForTracking](self, "_viewForTracking");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v10);
  v12 = v11;
  v14 = v13;
  objc_storeStrong((id *)&self->_event, v9);
  if (+[EventImportData isSessionManaged:](EventImportData, "isSessionManaged:", v7))
  {
    v15 = objc_alloc_init(DraggingContext);
    -[DraggingContext setIsManaged:](v15, "setIsManaged:", 1);
  }
  else
  {
    v15 = 0;
  }
  -[EKEventGestureController _setDraggingState:withPoint:event:context:](self, "_setDraggingState:withPoint:event:context:", 1, v9, v15, v12, v14);
  -[EKEventGestureController _updateFlingToCancelParameters](self, "_updateFlingToCancelParameters");
  v18 = -[EKEventGestureController _dropSessionRequiresExternalDataExtraction:](self, "_dropSessionRequiresExternalDataExtraction:", v7);

  if (!v18)
  {
LABEL_12:
    -[EKEventGestureController _disableSystemPreviewForDrag:](self, "_disableSystemPreviewForDrag:", v7);
    v19 = self;
    v20 = 0;
    goto LABEL_13;
  }
  v19 = self;
  v20 = 1;
LABEL_13:
  -[EKEventGestureController _setLocalDraggingViewHidden:](v19, "_setLocalDraggingViewHidden:", v20);

}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id WeakRetained;
  id v14;
  void *v15;
  uint64_t currentDraggingState;
  NSObject *v17;
  void *v18;
  unint64_t v19;
  id v20;
  void *v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((self->_currentDraggingState | 2) == 3)
  {
    -[EKEventGestureController _viewForTracking](self, "_viewForTracking");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v8);
    v10 = v9;
    v12 = v11;
    -[EKEventGestureController _installScrollTimer](self, "_installScrollTimer");
    self->_previousTouchPoint = self->_latestTouchPoint;
    self->_latestTouchPoint.x = v10;
    self->_latestTouchPoint.y = v12;
    WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

    if (WeakRetained)
    {
      v14 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
      objc_msgSend(v14, "eventGestureController:updateToPoint:", self, self->_latestTouchPoint.x, self->_latestTouchPoint.y);

    }
    else
    {
      v20 = objc_loadWeakRetained((id *)&self->_delegate);

      if (v20)
        -[EKEventGestureController _update](self, "_update");
    }
    -[EKEventGestureController _updateFlingToCancelParameters](self, "_updateFlingToCancelParameters");
    if (self->_isNewEvent)
    {
      v19 = -[EKEventGestureController _dropOperationGivenDropSession:](self, "_dropOperationGivenDropSession:", v7);

      if (v19 != 3)
        goto LABEL_16;
    }
    else
    {

    }
    if (objc_msgSend(v7, "allowsMoveOperation"))
      v19 = 3;
    else
      v19 = 2;
  }
  else
  {
    v15 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      currentDraggingState = self->_currentDraggingState;
      v17 = v15;
      -[EKEventGestureController _debugStringForDraggingState:](self, "_debugStringForDraggingState:", currentDraggingState);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v18;
      _os_log_impl(&dword_1AF84D000, v17, OS_LOG_TYPE_ERROR, "Received unexpected call to view:draggingUpdated: while in state: %@", (uint8_t *)&v23, 0xCu);

    }
    v19 = 1;
  }
LABEL_16:
  if (self->_currentDraggingState == 3)
    -[EKEventGestureController _setToSystemDraggingImageForDrag:](self, "_setToSystemDraggingImageForDrag:", v7);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", v19);
  objc_msgSend(v21, "setPrefersFullSizePreview:", 1);
  objc_msgSend(v21, "setPrecise:", 0);

  return v21;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[EKEventGestureController _viewForTracking](self, "_viewForTracking");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v5);
  -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 4 * (self->_currentDraggingState != 1), 0);
  -[EKEventGestureController _updateFlingToCancelParameters](self, "_updateFlingToCancelParameters");
  -[EKEventGestureController _enableSystemPreviewForDrag:](self, "_enableSystemPreviewForDrag:", v6);
  -[EKEventGestureController _setLocalDraggingViewHidden:](self, "_setLocalDraggingViewHidden:", 1);

}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  _BOOL4 v9;
  EKEvent *event;
  EKEvent *v11;
  EKEvent *v12;
  void *v13;
  int v14;
  EKEvent *v15;
  EKEvent *v16;
  void *v17;
  int v18;
  _QWORD v19[5];

  v5 = a4;
  -[EKEventGestureController _viewForTracking](self, "_viewForTracking");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  self->_latestTouchPoint.x = v7;
  self->_latestTouchPoint.y = v8;
  if (self->_currentDraggingState != 1)
  {
LABEL_9:
    -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 2, self->_event, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
    -[EKEventGestureController _updateFlingToCancelParameters](self, "_updateFlingToCancelParameters");
    goto LABEL_10;
  }
  v9 = -[EKEventGestureController _dropSessionRequiresExternalDataExtraction:](self, "_dropSessionRequiresExternalDataExtraction:", v5);
  event = self->_event;
  if (!v9)
  {
    if (!event)
    {
      -[EKEventGestureController _getEventUsingDropSession:](self, "_getEventUsingDropSession:", v5);
      v15 = (EKEvent *)objc_claimAutoreleasedReturnValue();
      v16 = self->_event;
      self->_event = v15;

    }
    goto LABEL_9;
  }
  if (!event)
  {
    -[EKEventGestureController _getEventUsingDropSession:](self, "_getEventUsingDropSession:", v5);
    v11 = (EKEvent *)objc_claimAutoreleasedReturnValue();
    v12 = self->_event;
    self->_event = v11;

  }
  -[EKEventGestureController _acceptedNonFileExternalTypes](self, "_acceptedNonFileExternalTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "hasItemsConformingToTypeIdentifiers:", v13);

  if (v14)
  {
    self->_dragCompletionPending = 1;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __56__EKEventGestureController_dropInteraction_performDrop___block_invoke;
    v19[3] = &unk_1E601CA50;
    v19[4] = self;
    +[EventImportData extractEventImportDataFromDropSession:completionBlock:](EventImportData, "extractEventImportDataFromDropSession:completionBlock:", v5, v19);
  }
  else
  {
    -[EKEventGestureController _acceptedFileExternalTypes](self, "_acceptedFileExternalTypes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v5, "hasItemsConformingToTypeIdentifiers:", v17);

    if (v18)
      -[EKEventGestureController _extractFileFromSession:](self, "_extractFileFromSession:", v5);
  }
LABEL_10:

}

void __56__EKEventGestureController_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__EKEventGestureController_dropInteraction_performDrop___block_invoke_2;
  v5[3] = &unk_1E6018EC0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __56__EKEventGestureController_dropInteraction_performDrop___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 44) = 0;
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 288))
  {
    objc_msgSend((id)v2, "_dismissCurrentICSPreviewControllerAnimated:", 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 64), "eventStore");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    if (objc_msgSend(v3, "requestedAction") == 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "_setDraggingState:withPoint:event:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(double *)(*(_QWORD *)(a1 + 32) + 112), *(double *)(*(_QWORD *)(a1 + 32) + 120));
      objc_msgSend(*(id *)(a1 + 40), "uniqueId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "uniqueId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "startDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_handleShowingEventWithUniqueId:date:eventStore:", v6, v7, v13);

      }
    }
    else
    {
      v8 = objc_msgSend(*(id *)(a1 + 40), "requestedAction");
      v9 = *(_QWORD *)(a1 + 32);
      if (v8 == 1)
      {
        objc_msgSend((id)v9, "_setDraggingState:withPoint:event:", 0, *(_QWORD *)(v9 + 64), *(double *)(v9 + 112), *(double *)(v9 + 120));
        objc_msgSend(*(id *)(a1 + 40), "icsData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "icsData");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_handleImportingICSData:intoEventStore:", v12, v13);

        }
      }
      else
      {
        objc_msgSend((id)v9, "_setupEvent:withImportData:", *(_QWORD *)(v9 + 64), *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 32), "_setDraggingState:withPoint:event:", 2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(double *)(*(_QWORD *)(a1 + 32) + 112), *(double *)(*(_QWORD *)(a1 + 32) + 120));
        objc_msgSend(*(id *)(a1 + 32), "_updateFlingToCancelParameters");
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setDraggingState:withPoint:event:", 0, 0, *(double *)(*(_QWORD *)(a1 + 32) + 112), *(double *)(*(_QWORD *)(a1 + 32) + 120));
  }

}

- (void)_extractFileFromSession:(id)a3
{
  id v4;
  void *v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  EKEventGestureController *v27;
  void *v28;
  id obj;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD block[5];
  char v35;
  _QWORD v36[5];
  id v37;
  NSObject *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_dragCompletionPending = 1;
  v27 = self;
  -[EKEventGestureController _acceptedFileExternalTypes](self, "_acceptedFileExternalTypes");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v28 = v4;
  objc_msgSend(v4, "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v33)
  {
    v31 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v44 != v31)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v8 = v32;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v40;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v40 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
              objc_msgSend(v7, "itemProvider");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "hasItemConformingToTypeIdentifier:", v13);

              if (v15)
              {
                objc_msgSend(v30, "addObject:", v7);
                objc_msgSend(v5, "addObject:", v13);
                goto LABEL_16;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            if (v10)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v33);
  }

  v16 = dispatch_group_create();
  v17 = v30;
  v18 = objc_msgSend(v30, "count");
  v19 = MEMORY[0x1E0C809B0];
  v20 = v5;
  if (v18)
  {
    v21 = 0;
    do
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v16);
      objc_msgSend(v22, "itemProvider");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v19;
      v36[1] = 3221225472;
      v36[2] = __52__EKEventGestureController__extractFileFromSession___block_invoke;
      v36[3] = &unk_1E601CA78;
      v36[4] = v27;
      v37 = v23;
      v38 = v16;
      v25 = v23;
      v26 = (id)objc_msgSend(v24, "loadFileRepresentationForTypeIdentifier:completionHandler:", v25, v36);

      v17 = v30;
      ++v21;
    }
    while (v21 < objc_msgSend(v30, "count"));
  }
  block[0] = v19;
  block[1] = 3221225472;
  block[2] = __52__EKEventGestureController__extractFileFromSession___block_invoke_117;
  block[3] = &unk_1E6019F18;
  block[4] = v27;
  v35 = 0;
  dispatch_group_notify(v16, MEMORY[0x1E0C80D38], block);

}

void __52__EKEventGestureController__extractFileFromSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA9FC8]), "initWithFilepath:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addAttachment:", v7);

  }
  else
  {
    v8 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_ERROR, "Unable to load file representation for type identifier [%{public}@]: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __52__EKEventGestureController__extractFileFromSession___block_invoke_117(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 44) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_setEventCalendar:useManagedCalendar:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setDraggingState:withPoint:event:", 2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(double *)(*(_QWORD *)(a1 + 32) + 112), *(double *)(*(_QWORD *)(a1 + 32) + 120));
  return objc_msgSend(*(id *)(a1 + 32), "_updateFlingToCancelParameters");
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  self->_dropAnimationInProgress = 0;
  -[EKEventGestureController _setLocalDraggingViewHidden:](self, "_setLocalDraggingViewHidden:", 0, a4);
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  uint64_t v5;
  _QWORD v6[5];

  v5 = MEMORY[0x1E0C809B0];
  self->_dropAnimationInProgress = 1;
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __77__EKEventGestureController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
  v6[3] = &unk_1E6018E98;
  v6[4] = self;
  objc_msgSend(a5, "addCompletion:", v6, a4);
}

uint64_t __77__EKEventGestureController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 45) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_setLocalDraggingViewHidden:", 0);
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id WeakRetained;
  id v12;
  EKDayOccurrenceView *v13;
  void *v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  id v39;
  id v40;

  v7 = a5;
  if (!+[EventImportData itemContainsCalendarICSData:](EventImportData, "itemContainsCalendarICSData:", a4))
  {
    -[EKEventGestureController _captureImageOfDraggingView](self, "_captureImageOfDraggingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v9);
    WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

    if (WeakRetained)
    {
      v12 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
      objc_msgSend(v12, "eventGestureControllerGetCurrentDraggingView:", self);
      v13 = (EKDayOccurrenceView *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_10;
    }
    else
    {
      v13 = self->_draggingView;
      if (!v13)
        goto LABEL_10;
    }
    if (v10)
    {
      -[EKDayOccurrenceView superview](v13, "superview");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_loadWeakRetained((id *)&self->_untimedDelegate);

      if (v15)
      {
        v16 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
        objc_msgSend(v16, "eventGestureController:finalFrameAfterCommitAtPoint:", self, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;

        -[EKEventGestureController _viewForTracking](self, "_viewForTracking");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "convertRect:fromView:", v25, v18, v20, v22, v24);
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;

      }
      else
      {
        -[EKDayOccurrenceView frame](v13, "frame");
        v31 = v34;
        v33 = v35;
        -[EKEventGestureController _estimateFinalDropOriginForTimedDelegate](self, "_estimateFinalDropOriginForTimedDelegate");
        v27 = v36;
        v29 = v37;
      }
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3770]), "initWithContainer:center:", v14, v27 + v31 * 0.5, v29 + v33 * 0.5);
      v39 = objc_alloc(MEMORY[0x1E0DC3D88]);
      v40 = objc_alloc_init(MEMORY[0x1E0DC3768]);
      v8 = (id)objc_msgSend(v39, "initWithView:parameters:target:", v10, v40, v38);

      goto LABEL_13;
    }
LABEL_10:
    v8 = v7;
LABEL_13:

    goto LABEL_14;
  }
  v8 = 0;
LABEL_14:

  return v8;
}

- (CGPoint)_estimateFinalDropOriginForTimedDelegate
{
  uint64_t v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id WeakRetained;
  uint64_t v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  v3 = 88;
  if (self->_currentDragType == 1)
    v3 = 112;
  v4 = *(double *)((char *)&self->super.isa + v3);
  v5 = self->_latestTouchPoint.y - self->_touchOffset.y;
  -[EKDayOccurrenceView travelTimeSubviewHeightInPoints](self->_draggingView, "travelTimeSubviewHeightInPoints");
  v7 = v5 + v6;
  if (self->_currentDragType == 1 && !self->_dragLockDisabled && self->_horizontalDragLocked)
  {
    -[EKDayOccurrenceView frame](self->_draggingView, "frame", v7);
    v9 = v8;
    -[EKDayOccurrenceView travelTimeSubviewHeightInPoints](self->_draggingView, "travelTimeSubviewHeightInPoints");
    v7 = v9 + v10;
  }
  -[EKEventGestureController _capOccurrenceViewYOrigin:](self, "_capOccurrenceViewYOrigin:", v7);
  v12 = v11;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = objc_msgSend(WeakRetained, "eventGestureController:isAllDayAtPoint:requireInsistence:", self, -[EKDayOccurrenceView isAllDay](self->_draggingView, "isAllDay") ^ 1, self->_latestTouchPoint.x, self->_latestTouchPoint.y);

  v15 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v15, "eventGestureController:dateAtPoint:", self, v4, v12);
  v17 = v16;

  -[EKEvent travelTime](self->_event, "travelTime");
  -[EKEventGestureController _computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:](self, "_computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:", v14, 0, 1, self->_latestTouchPoint.x, self->_latestTouchPoint.y, CalSnapDateTo15MinuteOr5MinuteInterval(self->_event, -[EKEventGestureController currentDragSnappingType](self, "currentDragSnappingType"), v17 - v18));
  result.y = v20;
  result.x = v19;
  return result;
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id v6;
  int currentDraggingState;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a3;
  v6 = a4;
  self->_currentDropDataOwnerCache = 0;
  if (!self->_dragCompletionPending)
  {
    currentDraggingState = self->_currentDraggingState;
    switch(currentDraggingState)
    {
      case 1:
        goto LABEL_5;
      case 4:
        -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 0, self->_event, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
        break;
      case 3:
LABEL_5:
        -[EKEventGestureController _viewForTracking](self, "_viewForTracking");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "locationInView:", v8);
        v10 = v9;
        v12 = v11;
        -[EKEventGestureController _updateFlingToCancelParameters](self, "_updateFlingToCancelParameters");
        -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 0, self->_event, v10, v12);

        break;
    }
  }

}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  int64_t result;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  result = self->_currentDropDataOwnerCache;
  if (!result)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CAA078]);
    self->_currentDropDataOwnerCache = 1;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v6, "calendarsForEntityType:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          if (-[EKEventGestureController _calendarCanAcceptManagedData:](self, "_calendarCanAcceptManagedData:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i)))
          {
            self->_currentDropDataOwnerCache = 3;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

    return self->_currentDropDataOwnerCache;
  }
  return result;
}

- (void)_disableSystemPreviewForDrag:(id)a3
{
  id v3;

  -[EKEventGestureController _findLocalDragItemInSession:](self, "_findLocalDragItemInSession:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreviewProvider:", &__block_literal_global_68);

}

uint64_t __57__EKEventGestureController__disableSystemPreviewForDrag___block_invoke()
{
  return 0;
}

- (void)_enableSystemPreviewForDrag:(id)a3
{
  id v3;

  -[EKEventGestureController _findLocalDragItemInSession:](self, "_findLocalDragItemInSession:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreviewProvider:", 0);

}

- (void)_setToSystemDraggingImageForDrag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  EKEvent *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  char isKindOfClass;
  NSObject *v15;
  uint8_t v16[8];
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v4 = a3;
  v5 = v4;
  v6 = v4;
  if (self->_needToSetSystemDragPreview)
  {
    objc_msgSend(v4, "localDragSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKEventGestureController _findLocalDragItemInSession:](self, "_findLocalDragItemInSession:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_event;
    if (v8
      || (objc_msgSend(v7, "localObject"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v13,
          (isKindOfClass & 1) != 0)
      && (objc_msgSend(v7, "localObject"), (v8 = (EKEvent *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v20 = 0;
      +[EKDayOccurrenceView viewForExternalDragOperationFromEvent:visiblePath:](EKDayOccurrenceView, "viewForExternalDragOperationFromEvent:visiblePath:", v8, &v20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v20;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __61__EKEventGestureController__setToSystemDraggingImageForDrag___block_invoke;
      v17[3] = &unk_1E601CAC0;
      v18 = v10;
      v19 = v9;
      v11 = v9;
      v12 = v10;
      objc_msgSend(v7, "setPreviewProvider:", v17);

    }
    else
    {
      v15 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1AF84D000, v15, OS_LOG_TYPE_ERROR, "Unable to create preview for dragging info: EKEvent was not found or generated", v16, 2u);
      }
      objc_msgSend(v7, "setPreviewProvider:", 0);
    }
    self->_needToSetSystemDragPreview = 0;

  }
}

id __61__EKEventGestureController__setToSystemDraggingImageForDrag___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3768]);
  objc_msgSend(v2, "setVisiblePath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3760]), "initWithView:parameters:", *(_QWORD *)(a1 + 40), v2);

  return v3;
}

- (void)_setLocalDraggingViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  EKDayOccurrenceView *draggingView;
  void *v6;
  id v7;

  v3 = a3;
  draggingView = self->_draggingView;
  if (draggingView)
  {
    -[EKDayOccurrenceView setHidden:](draggingView, "setHidden:", a3);
    -[EKDayOccurrenceView setDrawsResizeHandles:](self->_draggingView, "setDrawsResizeHandles:", v3 ^ 1);
  }
  -[EKEventGestureController untimedDelegate](self, "untimedDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[EKEventGestureController untimedDelegate](self, "untimedDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventGestureController:setDraggingViewHidden:", self, v3);

  }
}

- (void)_setToLocalDraggingImageForDrag:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  if (self->_currentDragType == 1
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate), WeakRetained, WeakRetained))
  {
    -[EKEventGestureController _findLocalDragItemInSession:](self, "_findLocalDragItemInSession:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventGestureController _captureImageOfDraggingView](self, "_captureImageOfDraggingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v7);
    -[EKEventGestureController _clippingPathForDraggingView](self, "_clippingPathForDraggingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__EKEventGestureController__setToLocalDraggingImageForDrag___block_invoke;
    v12[3] = &unk_1E601CAC0;
    v13 = v9;
    v14 = v8;
    v10 = v8;
    v11 = v9;
    objc_msgSend(v6, "setPreviewProvider:", v12);

  }
}

id __60__EKEventGestureController__setToLocalDraggingImageForDrag___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3768]);
  objc_msgSend(v2, "setVisiblePath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3760]), "initWithView:parameters:", *(_QWORD *)(a1 + 40), v2);

  return v3;
}

- (id)_captureImageOfDraggingView
{
  EKEventGestureControllerUntimedDelegate **p_untimedDelegate;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  p_untimedDelegate = &self->_untimedDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_untimedDelegate);
    objc_msgSend(v5, "eventGestureControllerGetCurrentDraggingView:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_opt_class();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v7, "_captureImageOfOccurrenceView:withFrameOfOpaqueContent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[EKDayOccurrenceView frameOfOpaqueContent](self->_draggingView, "frameOfOpaqueContent");
    objc_msgSend((id)objc_opt_class(), "_captureImageOfOccurrenceView:withFrameOfOpaqueContent:", self->_draggingView, v9, v10, v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)_clippingPathForDraggingView
{
  void *draggingView;

  draggingView = self->_draggingView;
  if (draggingView)
  {
    objc_msgSend(draggingView, "frameOfOpaqueContent");
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:");
    draggingView = (void *)objc_claimAutoreleasedReturnValue();
  }
  return draggingView;
}

+ (id)_captureImageOfOccurrenceView:(id)a3 withFrameOfOpaqueContent:(CGRect)a4
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v4, "isHidden");
  objc_msgSend(v4, "setNeedsDisplay");
  objc_msgSend(v4, "setHidden:", 0);
  objc_msgSend(v4, "layoutIfNeeded");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v6, v8);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__EKEventGestureController__captureImageOfOccurrenceView_withFrameOfOpaqueContent___block_invoke;
  v14[3] = &unk_1E601CAE8;
  v15 = v4;
  v11 = v4;
  objc_msgSend(v10, "imageWithActions:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", v9);

  return v12;
}

void __83__EKEventGestureController__captureImageOfOccurrenceView_withFrameOfOpaqueContent___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CGContext");

  objc_msgSend(v5, "renderInContext:", v4);
}

- (id)_findLocalDragItemInSession:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  EKEvent *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a3, "items", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "localObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v9, "localObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKDayOccurrenceView occurrence](self->_draggingView, "occurrence");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKDayOccurrenceView occurrence](self->_draggingView, "occurrence");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            v15 = self->_event;

            v13 = v15;
          }
          if ((objc_msgSend(v12, "isEqual:", v13) & 1) != 0 || !v13)
          {
            v16 = v9;

            goto LABEL_16;
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_16:

  return v16;
}

- (unint64_t)numberOfDragSourcesForView:(id)a3
{
  return 1;
}

- (BOOL)_isTouchFromDragSessionInResizeHandles:(id)a3
{
  objc_msgSend(a3, "locationInView:", self->_draggingView);
  return (-[EKDayOccurrenceView dragTypeFromPoint:](self->_draggingView, "dragTypeFromPoint:") & 0xFFFFFFFD) == 0;
}

- (id)_eventToUseAtInteractionStart:(CGPoint)a3 outOccurrenceView:(id *)a4
{
  double y;
  double x;
  EKEventGestureControllerDelegate **p_delegate;
  id WeakRetained;
  EKDayOccurrenceView *draggingView;
  EKDayOccurrenceView *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  unint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;

  y = a3.y;
  x = a3.x;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    if (self->_currentDraggingState == 2 && (draggingView = self->_draggingView) != 0 && self->_event)
      v11 = draggingView;
    else
      v11 = 0;
    v12 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v12, "eventGestureController:occurrenceViewAtPoint:ignoreSelectedCopyView:", self, 0, x, y);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11
      || (-[EKDayOccurrenceView occurrence](v11, "occurrence"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "occurrence"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v14, "isEqual:", v15),
          v15,
          v14,
          v16))
    {
      if (!v13)
      {
        -[EKEventGestureController _createNewEventIfNeededAtPoint:](self, "_createNewEventIfNeededAtPoint:", x, y);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      objc_msgSend(v13, "occurrences");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18 < 2)
      {
        v21 = objc_retainAutorelease(v13);
        *a4 = v21;
        objc_msgSend(v21, "occurrence");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (self->_currentDraggingState != 2)
          goto LABEL_19;
        -[EKEventGestureController _viewForTracking](self, "_viewForTracking");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "convertPoint:fromView:", v22, x, y);
        v24 = v23;
        v26 = v25;

        if ((objc_msgSend(v21, "dragTypeFromPoint:", v24, v26) & 0xFFFFFFFD) != 0)
          goto LABEL_19;

      }
      else
      {
        CalPlopViewWithScaleFactorAndCompletion(v13, 0, 1.0);
      }
    }
    v19 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v20 = objc_loadWeakRetained((id *)&self->_untimedDelegate);

  if (v20)
  {
    v11 = (EKDayOccurrenceView *)objc_loadWeakRetained((id *)&self->_untimedDelegate);
    -[EKDayOccurrenceView eventGestureController:eventToStartInteractionWithAtPoint:](v11, "eventGestureController:eventToStartInteractionWithAtPoint:", self, x, y);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

    return v19;
  }
  v19 = 0;
  return v19;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v9;
  id v10;
  char v11;
  id v12;
  char v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  _BOOL4 v24;
  int v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  char v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  id (*v59)(uint64_t, void *);
  void *v60;
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD aBlock[4];
  id v67;
  id v68[2];

  v5 = a4;
  if (-[EKEventGestureController dragGestureInProgress](self, "dragGestureInProgress") || self->_dragInitiationLocked)
    goto LABEL_3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (v9 = WeakRetained,
        v10 = objc_loadWeakRetained((id *)&self->_delegate),
        v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = objc_msgSend(v12, "eventGestureControllerShouldAllowLongPress:", self);

    if ((v13 & 1) != 0)
      goto LABEL_11;
  }
  else
  {
    v14 = objc_loadWeakRetained((id *)&self->_untimedDelegate);

    if (!v14
      || (v15 = objc_loadWeakRetained((id *)&self->_untimedDelegate),
          v16 = objc_msgSend(v15, "eventGestureControllerShouldAllowLongPress:", self),
          v15,
          v16))
    {
LABEL_11:
      -[EKEventGestureController _viewForTracking](self, "_viewForTracking");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locationInView:", v17);
      v19 = v18;
      v21 = v20;

      -[EKEventGestureController _setUpInitialTouchPointsWithPoint:](self, "_setUpInitialTouchPointsWithPoint:", v19, v21);
      v68[0] = 0;
      -[EKEventGestureController _eventToUseAtInteractionStart:outOccurrenceView:](self, "_eventToUseAtInteractionStart:outOccurrenceView:", v68, v19, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v68[0];
      if (!v22)
        goto LABEL_40;
      if ((objc_msgSend(v22, "isNew") & 1) == 0)
      {
        v24 = -[EKEventGestureController canProposeNewTime:](self, "canProposeNewTime:", v22);
        v25 = objc_msgSend(v22, "isEditable") | v24;
        if (objc_msgSend(v22, "isReminderIntegrationEvent"))
        {
          if ((objc_msgSend(v22, "CUIK_reminderShouldBeEditable") & v25 & 1) == 0)
            goto LABEL_15;
        }
        else if ((v25 & 1) == 0)
        {
LABEL_15:
          v26 = objc_loadWeakRetained((id *)&self->_delegate);

          if (v26)
          {
            v27 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v23, "occurrenceDate");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "eventGestureController:occurrenceViewForOccurrence:occurrenceDate:", self, v22, v28);
            v29 = (id)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              -[EKEventGestureController _updatePositionOfEditingMenuForView:](self, "_updatePositionOfEditingMenuForView:", v29);
LABEL_39:
              v6 = (void *)MEMORY[0x1E0C9AA60];
LABEL_36:

LABEL_41:
              goto LABEL_4;
            }
          }
          else
          {
            v56 = objc_loadWeakRetained((id *)&self->_untimedDelegate);

            if (v56)
            {
              v29 = objc_loadWeakRetained((id *)&self->_untimedDelegate);
              objc_msgSend(v29, "eventGestureController:requestedCancellationAnimationAtPoint:withOccurrence:", self, v22, v19, v21);
              goto LABEL_39;
            }
          }
LABEL_40:
          v6 = (void *)MEMORY[0x1E0C9AA60];
          goto LABEL_41;
        }
      }
      v29 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
      objc_msgSend(v29, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("com.apple.eventkit.internal"), 3, &__block_literal_global_132);
      if ((objc_msgSend(v22, "isNew") & 1) == 0 && (objc_msgSend(v22, "isReminderIntegrationEvent") & 1) == 0)
      {
        v30 = v22;
        v31 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke_2;
        aBlock[3] = &unk_1E601CB50;
        v32 = v30;
        v67 = v32;
        v33 = _Block_copy(aBlock);
        objc_msgSend(v29, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("com.apple.calendar.ics"), 0, v33);
        objc_msgSend(v29, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("com.apple.ical.ics"), 0, v33);
        v34 = *MEMORY[0x1E0DC5B48];
        v64[0] = v31;
        v64[1] = 3221225472;
        v64[2] = __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke_3;
        v64[3] = &unk_1E601CB50;
        v65 = v32;
        v35 = v32;
        objc_msgSend(v29, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v34, 0, v64);

      }
      if ((objc_msgSend(v22, "isNew") & 1) == 0)
      {
        objc_msgSend(v22, "title");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "length");

        if (v37)
        {
          objc_msgSend(MEMORY[0x1E0D0CD58], "sharedGenerator");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "textRepresentationForEvent:withTextFormat:showURI:", v22, 0, 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = MEMORY[0x1E0C809B0];
          v62[0] = MEMORY[0x1E0C809B0];
          v62[1] = 3221225472;
          v62[2] = __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke_4;
          v62[3] = &unk_1E601CB50;
          v42 = v39;
          v63 = v42;
          objc_msgSend(v29, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v40, 0, v62);

          objc_msgSend((id)*MEMORY[0x1E0CEC628], "identifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v41;
          v58 = 3221225472;
          v59 = __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke_5;
          v60 = &unk_1E601CB50;
          v61 = v42;
          v44 = v42;
          objc_msgSend(v29, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v43, 0, &v57);

        }
      }
      objc_msgSend(v22, "title", v57, v58, v59, v60);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "length");

      if (v46)
      {
        objc_msgSend(v22, "title");
        v47 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v22, "isNew"))
          goto LABEL_30;
        +[EKEventEditor defaultTitleForCalendarItem](EKEventEditor, "defaultTitleForCalendarItem");
        v47 = objc_claimAutoreleasedReturnValue();
      }
      v48 = (void *)v47;
      objc_msgSend(v29, "setSuggestedName:", v47);

LABEL_30:
      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v29);
      objc_msgSend(v49, "setLocalObject:", v22);
      if ((objc_msgSend(v22, "isNew") & 1) != 0)
        goto LABEL_34;
      objc_msgSend(v22, "calendar");
      v50 = objc_claimAutoreleasedReturnValue();
      if (!v50)
        goto LABEL_34;
      v51 = (void *)v50;
      objc_msgSend(v22, "calendar");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "isManaged");

      if ((v53 & 1) != 0)
        v54 = 1;
      else
LABEL_34:
        v54 = 2;
      objc_msgSend(v49, "set_managementState:", v54);
      objc_storeStrong((id *)&self->_event, v22);
      objc_msgSend(v23, "occurrenceDate");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      self->_occurrenceDateIndex = -[EKEventGestureController _occurrenceDateIndexWithEvent:occurrenceDate:](self, "_occurrenceDateIndexWithEvent:occurrenceDate:", v22, v55);

      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v49);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_36;
    }
  }
LABEL_3:
  v6 = (void *)MEMORY[0x1E0C9AA60];
LABEL_4:

  return v6;
}

id __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB38A8];
  v3 = a2;
  objc_msgSend(v2, "progressWithTotalUnitCount:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompletedUnitCount:", 1);
  (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);

  return v4;
}

id __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB38A8];
  v4 = a2;
  objc_msgSend(v3, "progressWithTotalUnitCount:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompletedUnitCount:", 1);
  objc_msgSend(*(id *)(a1 + 32), "exportToICS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v6, 0);

  return v5;
}

id __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3B10];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithActivityType:", CFSTR("com.apple.calendar.continuity.event_selection"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0CE40]), "initWithEvent:view:", *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(v6, "updateActivity:", v5);
  objc_msgSend(v5, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", *MEMORY[0x1E0DC5B48], v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB38A8];
  v4 = a2;
  objc_msgSend(v3, "progressWithTotalUnitCount:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompletedUnitCount:", 1);
  objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v6, 0);

  return v5;
}

id __69__EKEventGestureController_dragInteraction_itemsForBeginningSession___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB38A8];
  v4 = a2;
  objc_msgSend(v3, "progressWithTotalUnitCount:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompletedUnitCount:", 1);
  objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v6, 0);

  return v5;
}

- (EKCalendarDate)occurrenceDate
{
  void *v3;
  void *v4;

  -[EKEvent startCalendarDate](self->_event, "startCalendarDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarDateByAddingDays:", self->_occurrenceDateIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKCalendarDate *)v4;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_draggingView
    || !-[EKEventGestureController _isTouchFromDragSessionInResizeHandles:](self, "_isTouchFromDragSessionInResizeHandles:", v10))
  {
    -[EKEventGestureController _viewForTracking](self, "_viewForTracking");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationInView:", v11);
    -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 3, 0);
    -[EKEventGestureController _updateFlingToCancelParameters](self, "_updateFlingToCancelParameters");

  }
  self->_needToSetSystemDragPreview = 1;

  return 0;
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;

  v4 = a3;
  if (self->_waitingForDragToInitialize)
  {
    v7 = v4;
    if (!self->_draggingView
      || self->_currentDragType == 1
      || (-[EKEventGestureController _viewForTracking](self, "_viewForTracking"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "convertPoint:toView:", self->_draggingView, self->_latestTouchPoint.x, self->_latestTouchPoint.y), v6 = -[EKDayOccurrenceView dragTypeFromPoint:](self->_draggingView, "dragTypeFromPoint:") & 0xFFFFFFFD, v5, v4 = v7, v6))
    {
      if (self->_currentDraggingState == 3)
      {
        -[EKEventGestureController _setLocalDraggingViewHidden:](self, "_setLocalDraggingViewHidden:", 0);
        self->_dragInteractionCancellingWithoutDragging = 1;
        -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 2, self->_event, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
        self->_dragInteractionCancellingWithoutDragging = 0;
      }
      else
      {
        -[EKEventGestureController _dragFailedToStart](self, "_dragFailedToStart");
      }
      v4 = v7;
    }
    self->_waitingForDragToInitialize = 0;
  }

}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  -[EKEventGestureController _hideEditingMenuForView:](self, "_hideEditingMenuForView:", self->_draggingView, a4);
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  return 1;
}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  return 0;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  if (self->_waitingForDragToInitialize
    && (!self->_draggingView
     || !-[EKEventGestureController _isTouchFromDragSessionInResizeHandles:](self, "_isTouchFromDragSessionInResizeHandles:", v7)))
  {
    -[EKEventGestureController _setLocalDraggingViewHidden:](self, "_setLocalDraggingViewHidden:", 0);
    -[EKEventGestureController _setDraggingState:withPoint:event:](self, "_setDraggingState:withPoint:event:", 2, 0, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
  }

}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  int64_t v12;

  -[EKEventGestureController _findLocalDragItemInSession:](self, "_findLocalDragItemInSession:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v4, "localObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendar");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

    goto LABEL_6;
  }
  v9 = (void *)v8;
  objc_msgSend(v7, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isManaged");

  if ((v11 & 1) == 0)
  {
LABEL_6:
    v12 = 1;
    goto LABEL_7;
  }
  v12 = 2;
LABEL_7:

  return v12;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  return 1;
}

- (BOOL)_dragInteraction:(id)a3 sessionSupportsSystemDrag:(id)a4
{
  return 0;
}

- (id)originalStartDateForEvent:(id)a3 includingTravel:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isProposedTime");

  if (v8)
  {
    objc_msgSend(v6, "proposedStartDate");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
      objc_msgSend(v6, "startDateIncludingTravel");
    else
      objc_msgSend(v6, "startDate");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (BOOL)splitMultiDays
{
  void *v3;
  void *v4;
  char v5;

  if (!-[EKEvent isAllDay](self->_event, "isAllDay"))
    return 0;
  -[EKEventGestureController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[EKEventGestureController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "eventGestureControllerShouldSplitMultiDayAllDayEvents:", self);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_createTemporaryView:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  EKCalendarDate *v22;
  EKCalendarDate *currentDay;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int64_t touchOffsetDays;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  _BOOL4 v67;

  v67 = a4;
  v5 = a3;
  -[EKEventGestureController originalStartDateForEvent:includingTravel:](self, "originalStartDateForEvent:includingTravel:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  v9 = objc_msgSend(v5, "isAllDay");
  v10 = (void *)MEMORY[0x1E0D0C420];
  objc_msgSend(v5, "eventStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "calendarDateWithAbsoluteTime:timeZone:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "calendarDateForDay");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "eventGestureController:dateAtPoint:", self, self->_firstTouchPoint.x, self->_firstTouchPoint.y);
  v17 = v16;

  v18 = (void *)MEMORY[0x1E0D0C420];
  objc_msgSend(v5, "eventStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeZone");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "calendarDateWithAbsoluteTime:timeZone:", v20, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "calendarDateForDay");
  v22 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue();
  currentDay = self->_currentDay;
  self->_currentDay = v22;

  if (self->_currentDraggingState == 1 || self->_pendingDraggingState == 1)
  {
    self->_touchOffsetDays = 0;
    self->_commitOffsetDays = 0;
    v8 = v17;
  }
  else if (-[EKEventGestureController splitMultiDays](self, "splitMultiDays")
         && objc_msgSend(v5, "isAllDay"))
  {
    v57 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v57, "eventGestureController:dateAtPoint:", self, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
    v59 = v58;

    v60 = (void *)MEMORY[0x1E0D0C420];
    objc_msgSend(v5, "eventStore");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "timeZone");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "calendarDateWithAbsoluteTime:timeZone:", v62, v59);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "calendarDateForDay");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v64, "absoluteTime");
    v8 = v65;
    self->_touchOffsetDays = 0;
    self->_commitOffsetDays = objc_msgSend(v64, "differenceInDays:", v14);

  }
  else
  {
    self->_touchOffsetDays = -[EKCalendarDate differenceInDays:](self->_currentDay, "differenceInDays:", v14);
    self->_commitOffsetDays = 0;
    if (-[EKEvent isAllDay](self->_event, "isAllDay"))
    {
      -[EKCalendarDate absoluteTime](self->_currentDay, "absoluteTime");
      v8 = v66;
    }
  }
  v24 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v24, "eventGestureController:pointAtDate:isAllDay:", self, objc_msgSend(v5, "isAllDay"), v8);
  v26 = v25;
  v28 = v27;

  objc_msgSend(v5, "durationIncludingTravel");
  v30 = fmin(v29, 86400.0);
  if ((objc_msgSend(v5, "isAllDay") & 1) == 0)
  {
    touchOffsetDays = self->_touchOffsetDays;
    if (touchOffsetDays >= 1 && touchOffsetDays + 1 == objc_msgSend(v5, "daySpan"))
    {
      v32 = (void *)MEMORY[0x1E0D0C420];
      objc_msgSend(v5, "endDateUnadjustedForLegacyClients");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeZone");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "calendarDateWithDate:timeZone:", v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "absoluteTime");
      v37 = v36;
      objc_msgSend(v35, "calendarDateForDay");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "absoluteTime");
      v30 = v37 - v39;

    }
  }
  v40 = objc_loadWeakRetained((id *)&self->_delegate);
  v41 = (void *)objc_msgSend(v40, "createOccurrenceViewForEventGestureController:", self);

  objc_msgSend(v41, "setSelected:", 1);
  -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setIsProposedTime:", objc_msgSend(v42, "isProposedTime"));

  objc_msgSend(v41, "setOccurrence:", v5);
  -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "occurrenceDate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startCalendarDate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setOccurrenceDateIndex:", objc_msgSend(v44, "differenceInDays:", v45));

  objc_msgSend(v41, "setPointerInteractionDisabled:", 1);
  -[EKDayOccurrenceView margin](self->_draggingViewSource, "margin");
  objc_msgSend(v41, "setMargin:");
  -[EKDayOccurrenceView padding](self->_draggingViewSource, "padding");
  objc_msgSend(v41, "setPadding:");
  -[EKEventGestureController _computeWidthForOccurrenceView](self, "_computeWidthForOccurrenceView");
  -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", self->_event, v9, v30);
  -[EKEventGestureController _computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:](self, "_computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:", v9, 0, 1, v26, v28, v8);
  objc_msgSend(v41, "setFrame:");
  v46 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v46, "occurrenceViewSuperviewForEventGestureController:", self);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v47, "addSubview:", v41);
  objc_msgSend(v41, "setAllDay:", v9);
  objc_msgSend(v41, "setHasPrecedingDuration:", -[EKDayOccurrenceView hasPrecedingDuration](self->_draggingViewSource, "hasPrecedingDuration"));
  objc_msgSend(v41, "setHasTrailingDuration:", -[EKDayOccurrenceView hasTrailingDuration](self->_draggingViewSource, "hasTrailingDuration"));
  v48 = DraggedEventShadowColor();
  objc_msgSend(v41, "layer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setShadowColor:", v48);

  objc_msgSend(v41, "layer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v51) = 1043878380;
  objc_msgSend(v50, "setShadowOpacity:", v51);

  objc_msgSend(v41, "layer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setShadowRadius:", 10.0);

  objc_msgSend(v41, "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setShadowOffset:", 0.0, 9.0);

  v54 = objc_loadWeakRetained((id *)&self->_delegate);
  -[EKEventGestureController event](self, "event");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "eventGestureController:adjustDraggingView:forAllDay:", self, v41, objc_msgSend(v55, "isAllDay"));

  objc_msgSend(v41, "requestContentIfNeeded:completion:", 16, 0);
  if (v67)
    -[EKEventGestureController _animateInNewEvent](self, "_animateInNewEvent");
  else
    -[EKEventGestureController setCommitBlocked:](self, "setCommitBlocked:", 0);

  return v41;
}

- (void)_updatePositionOfEditingMenuForView:(id)a3
{
  if (!self->_isNewEvent)
    objc_msgSend(a3, "presentEditingMenuFromGestureController:", self);
}

- (void)_hideEditingMenuForView:(id)a3
{
  objc_msgSend(a3, "dismissEditingMenu");
}

- (void)_animateInNewEvent
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  EKDayOccurrenceView *v11;
  EKDayOccurrenceView *draggingView;
  _QWORD v13[5];
  _QWORD v14[5];

  -[EKDayOccurrenceView frame](self->_draggingView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[EKEventGestureController setCommitBlocked:](self, "setCommitBlocked:", 1);
  if (self->_isNewEvent && !self->_forcedStart)
  {
    draggingView = self->_draggingView;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__EKEventGestureController__animateInNewEvent__block_invoke;
    v14[3] = &unk_1E6018688;
    v14[4] = self;
    CalPopViewIn(draggingView, v14);
  }
  else
  {
    v11 = self->_draggingView;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__EKEventGestureController__animateInNewEvent__block_invoke_2;
    v13[3] = &unk_1E6018688;
    v13[4] = self;
    CalScaleViewIn(v11, v13, v4, v6, v8, v10);
  }
}

uint64_t __46__EKEventGestureController__animateInNewEvent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCommitBlocked:", 0);
}

uint64_t __46__EKEventGestureController__animateInNewEvent__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCommitBlocked:", 0);
}

- (void)_setTouchOffsetsFromPoint:(CGPoint)a3 fixedToCenter:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  void *v8;
  id WeakRetained;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  void *v22;
  objc_class *v23;
  uint64_t v24;
  id v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  id v34;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[EKDayOccurrenceView occurrence](self->_draggingView, "occurrence");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  -[EKDayOccurrenceView occurrenceDate](self->_draggingView, "occurrenceDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "touchTrackingViewForEventGestureController:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "convertPoint:toView:", self->_draggingView, x, y);
  if (v4)
  {
    -[EKDayOccurrenceView bounds](self->_draggingView, "bounds");
    v14 = v13 * 0.5;
    -[EKDayOccurrenceView bounds](self->_draggingView, "bounds");
    v16 = v15 * 0.5;
  }
  else
  {
    v14 = v11;
    v16 = v12;
  }
  -[EKDayOccurrenceView margin](self->_draggingView, "margin");
  v18 = v14 + v17;
  -[EKDayOccurrenceView margin](self->_draggingView, "margin");
  v20 = v16 + v19;
  self->_currentDragType = -[EKDayOccurrenceView dragTypeFromPoint:](self->_draggingView, "dragTypeFromPoint:", v18, v20);
  self->_touchOffset.x = v18;
  self->_touchOffset.y = v20;
  objc_msgSend(v34, "startCalendarDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "calendarDateForDay");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v23 = 0;
  }
  else
  {
    if (-[EKEventGestureController splitMultiDays](self, "splitMultiDays"))
    {
      v23 = (objc_class *)objc_msgSend(v8, "differenceInDays:", v22);
      self->_touchOffsetDays = 0;
      v24 = 184;
      goto LABEL_10;
    }
    v23 = (objc_class *)-[EKCalendarDate differenceInDays:](self->_currentDay, "differenceInDays:", v22);
  }
  v24 = 176;
LABEL_10:
  *(Class *)((char *)&self->super.isa + v24) = v23;
  v25 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v25, "eventGestureController:dateAtPoint:", self, self->_firstTouchPoint.x, self->_firstTouchPoint.y);
  self->_dateAtFirstTouchPoint = v26;

  v27 = (void *)MEMORY[0x1E0D0C420];
  objc_msgSend(v34, "endDateUnadjustedForLegacyClients");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "eventStore");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "timeZone");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "calendarDateWithDate:timeZone:", v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "calendarDateForDay");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v34, "isAllDay") & 1) != 0)
    LOBYTE(v33) = 0;
  else
    v33 = objc_msgSend(v22, "isEqual:", v32) ^ 1;
  self->_isMultiDayTimedEvent = v33;
  -[EKEventGestureController _updateSnappingTypeForCurrentDrag](self, "_updateSnappingTypeForCurrentDrag");

}

- (void)_setUpAfterForcedStartFromPoint:(CGPoint)a3
{
  double y;
  double x;
  EKDayOccurrenceView *draggingView;
  id WeakRetained;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  EKEvent *event;
  void *v21;
  double v22;
  double v23;
  void *v24;
  id v25;

  y = a3.y;
  x = a3.x;
  draggingView = self->_draggingView;
  if (!draggingView || !self->_event)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalendarEventGestures.m"), 2783, CFSTR("Gesture controller tried to set up after a forced start, but with no view and/or event to drag"));

    draggingView = self->_draggingView;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "occurrenceViewSuperviewForEventGestureController:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CalSwitchViewToSuperview(draggingView, v9);

  -[EKEventGestureController _setTouchOffsetsFromPoint:fixedToCenter:](self, "_setTouchOffsetsFromPoint:fixedToCenter:", 0, x, y);
  self->_isNewEvent = -[EKEvent isNew](self->_event, "isNew");
  if (self->_currentDragType != 1)
  {
    v10 = (void *)objc_opt_class();
    -[EKDayOccurrenceView bounds](self->_draggingView, "bounds");
    objc_msgSend(v10, "contentStretchRectForFrame:");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[EKDayOccurrenceView layer](self->_draggingView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setContentsCenter:", v12, v14, v16, v18);

  }
  if (!self->_isMultiDayTimedEvent || !self->_touchOffsetDays)
    -[EKDayOccurrenceView setDrawsResizeHandles:](self->_draggingView, "setDrawsResizeHandles:", 1);
  event = self->_event;
  if (self->_currentDragType == 2)
    -[EKEvent endDateUnadjustedForLegacyClients](event, "endDateUnadjustedForLegacyClients");
  else
    -[EKEvent startDateIncludingTravel](event, "startDateIncludingTravel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timeIntervalSinceReferenceDate");
  v23 = v22;

  v25 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v25, "eventGestureController:didSetUpAtDate:isAllDay:", self, -[EKDayOccurrenceView isAllDay](self->_draggingView, "isAllDay"), v23);

}

- (double)_minimumDuration
{
  id WeakRetained;
  _BOOL4 IsRegularInViewHierarchy;
  double result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(WeakRetained);

  result = 1800.0;
  if (IsRegularInViewHierarchy)
    return 900.0;
  return result;
}

- (void)_update
{
  id WeakRetained;
  int v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t touchOffsetDays;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  int v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  EKCalendarDate *v73;
  EKCalendarDate *currentDay;
  id v75;
  id v76;
  double v77;
  double v78;
  void *v79;
  int v80;
  EKDayOccurrenceView *draggingView;
  void *v82;
  void *v83;
  void *v85;
  id v86;

  if (!self->_draggingView)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalendarEventGestures.m"), 2812, CFSTR("Gesture controller tried to update, but with no view to drag"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "eventGestureController:isAllDayAtPoint:requireInsistence:", self, -[EKDayOccurrenceView isAllDay](self->_draggingView, "isAllDay") ^ 1, self->_latestTouchPoint.x, self->_latestTouchPoint.y);

  if (v4)
    v5 = self->_currentDragType == 1;
  else
    v5 = 0;
  if (-[EKEvent hasRecurrenceRules](self->_event, "hasRecurrenceRules")
    && (_DWORD)v5 != -[EKEvent isAllDay](self->_event, "isAllDay"))
  {
    v5 = -[EKEvent isAllDay](self->_event, "isAllDay") & v5;
  }
  -[EKDayOccurrenceView occurrence](self->_draggingView, "occurrence");
  v86 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  objc_msgSend(v86, "endDateUnadjustedForLegacyClients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;

  objc_msgSend(v86, "duration");
  v13 = v12;
  v14 = self->_latestTouchPoint.y - self->_touchOffset.y;
  -[EKDayOccurrenceView travelTimeSubviewHeightInPoints](self->_draggingView, "travelTimeSubviewHeightInPoints");
  -[EKEventGestureController _capOccurrenceViewYOrigin:](self, "_capOccurrenceViewYOrigin:", v14 + v15);
  v17 = v16;
  if (self->_currentDragType == 1)
  {
    if ((objc_msgSend(v86, "isAllDay") ^ 1 | v5) == 1)
    {
      if ((objc_msgSend(v86, "isAllDay") & 1) == 0 && ((v5 ^ 1) & 1) == 0)
      {
        objc_msgSend(v86, "setTravelTime:", 0.0);
        v13 = 86399.0;
      }
    }
    else
    {
      v13 = 3600.0;
    }
    v40 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v40, "eventGestureController:dateAtPoint:", self, self->_latestTouchPoint.x, v17);
    v38 = v41;

    goto LABEL_29;
  }
  v18 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v18, "eventGestureController:dateAtPoint:", self, self->_firstTouchPoint.x, v17);
  v20 = v19;

  if (!self->_currentDragType)
  {
    -[EKEventGestureController _minimumDuration](self, "_minimumDuration");
    v43 = v11 - v42;
    if (v20 <= v43)
      v38 = v20;
    else
      v38 = v43;
    v13 = v11 - v38;
LABEL_29:
    v39 = v38;
    goto LABEL_30;
  }
  objc_msgSend(v86, "travelTime");
  v22 = fmin(v13 + v21, 86400.0);
  v23 = (void *)MEMORY[0x1E0D0C420];
  -[EKEvent eventStore](self->_event, "eventStore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "timeZone");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "calendarDateWithAbsoluteTime:timeZone:", v25, v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[EKEvent isAllDay](self->_event, "isAllDay"))
  {
    touchOffsetDays = self->_touchOffsetDays;
    if (touchOffsetDays >= 1 && touchOffsetDays + 1 == objc_msgSend(v86, "daySpan"))
    {
      objc_msgSend(v26, "absoluteTime");
      v29 = v28;
      objc_msgSend(v26, "calendarDateForDay");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "absoluteTime");
      v22 = v29 - v31;

    }
  }
  -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", 0, 0, v22);
  v33 = round(v32) + self->_latestTouchPoint.y - self->_touchOffset.y;
  v34 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v34, "eventGestureController:dateAtPoint:", self, self->_firstTouchPoint.x, v33);
  v36 = v35;

  -[EKEventGestureController _minimumDuration](self, "_minimumDuration");
  if (v13 + v36 - v11 >= v37)
    v13 = v13 + v36 - v11;
  else
    v13 = v37;
  v38 = v8 + v13;

  v39 = v8;
LABEL_30:
  if (self->_touchOffsetDays < 1 || (objc_msgSend(v86, "isAllDay") & 1) != 0)
  {
    v44 = v39;
  }
  else
  {
    v44 = v39;
    if (self->_currentDragType != 2)
    {
      v76 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v76, "eventGestureController:dateAtPoint:", self, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
      v78 = v77;

      v44 = v8 + v78 - self->_dateAtFirstTouchPoint;
      v38 = v44;
    }
  }
  -[EKEventGestureController _computeWidthForOccurrenceView](self, "_computeWidthForOccurrenceView");
  v46 = v45;
  -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", v86, v5, v13);
  v48 = v47;
  -[EKDayOccurrenceView enoughHeightForOneLine](self->_draggingViewSource, "enoughHeightForOneLine");
  if (v48 >= v49)
    v50 = v48;
  else
    v50 = v49;
  objc_msgSend(v86, "travelTime");
  v51 = 0.0;
  if (v52 > 0.0)
  {
    objc_msgSend(v86, "travelTime");
    -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", v86, 0);
    v51 = v53;
  }
  if (self->_touchOffsetDays < 1 || (v54 = objc_msgSend(v86, "isAllDay"), v55 = v39, v54))
  {
    objc_msgSend(v86, "travelTime");
    v55 = v44 - v56;
  }
  v57 = v50 + v51;
  -[EKEventGestureController _computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:](self, "_computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:", v5, self->_currentDragType == 1, 1, self->_latestTouchPoint.x, self->_latestTouchPoint.y, v55);
  v59 = v58;
  v61 = v60;
  v62 = -[EKEventGestureController _isPointInCancelRegion:](self, "_isPointInCancelRegion:", self->_latestTouchPoint.x, self->_latestTouchPoint.y);
  v63 = (void *)MEMORY[0x1E0D0C420];
  objc_msgSend(v86, "eventStore");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "timeZone");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "calendarDateWithAbsoluteTime:timeZone:", v65, v39);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "calendarDateForDay");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v67, "isEqual:", self->_currentDay)
    && (_DWORD)v5 == -[EKDayOccurrenceView isAllDay](self->_draggingView, "isAllDay")
    && (self->_isInCancelRegion == v62 || (_DWORD)v5 == -[EKDayOccurrenceView isAllDay](self->_draggingView, "isAllDay")))
  {
    -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "isProposedTime");
    draggingView = self->_draggingView;
    if (v80)
    {
      -[EKDayOccurrenceView setIsProposedTime:](draggingView, "setIsProposedTime:", 1);
    }
    else
    {
      -[EKDayOccurrenceView occurrence](draggingView, "occurrence");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKDayOccurrenceView setIsProposedTime:](self->_draggingView, "setIsProposedTime:", -[EKEventGestureController canProposeNewTime:](self, "canProposeNewTime:", v82));

    }
    -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "travelTimeSubviewHeightInPoints");
    -[EKDayOccurrenceView setTravelTimeSubviewHeightInPoints:](self->_draggingView, "setTravelTimeSubviewHeightInPoints:");

    -[EKDayOccurrenceView setFrame:](self->_draggingView, "setFrame:", v59, v61, v46, v57);
    -[EKDayOccurrenceView requestContentIfNeeded:completion:](self->_draggingView, "requestContentIfNeeded:completion:", 16, 0);
    -[EKDayOccurrenceView setNeedsLayout](self->_draggingView, "setNeedsLayout");
  }
  else
  {
    v68 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v68, "eventGestureController:adjustDraggingView:forAllDay:", self, self->_draggingView, v5);

    -[EKDayOccurrenceView animateToFrame:isAllDay:beginFromCurrentState:whenFinished:](self->_draggingView, "animateToFrame:isAllDay:beginFromCurrentState:whenFinished:", v5, 1, 0, v59, v61, v46, v57);
  }
  v69 = (void *)MEMORY[0x1E0D0C420];
  objc_msgSend(v86, "eventStore");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "timeZone");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "calendarDateWithAbsoluteTime:timeZone:", v71, v39);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "calendarDateForDay");
  v73 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue();
  currentDay = self->_currentDay;
  self->_currentDay = v73;

  self->_isInCancelRegion = v62;
  v75 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v75, "eventGestureController:didMoveToDate:isAllDay:", self, v5, v38);

}

- (void)_commit
{
  void *v4;
  EKCalendarDate *v5;
  EKCalendarDate *currentDay;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  int v20;
  _BOOL8 v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  int64_t touchOffsetDays;
  int v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  id v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  int currentDragType;
  double v52;
  int v53;
  double v54;
  id WeakRetained;
  EKDayOccurrenceView *draggingView;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  double v66;
  double v67;
  id v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  int64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  double v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  int v115;
  char v116;
  int v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  _UIDragSnappingFeedbackGenerator *v122;
  _UIDragSnappingFeedbackGenerator *dragSnappingFeedback;
  BOOL v124;
  void *v125;
  id v126;
  _UIDragSnappingFeedbackGenerator *v127;
  char v128;
  id v129;
  _QWORD v130[4];
  _UIDragSnappingFeedbackGenerator *v131;
  EKEventGestureController *v132;
  id v133;
  double v134;
  BOOL v135;
  BOOL v136;
  _QWORD v137[9];
  _QWORD v138[5];
  id v139;
  id v140;
  char v141;
  uint64_t v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  int v146;

  if (-[EKEventGestureController _flingOrCancelDraggingViewIfNeeded](self, "_flingOrCancelDraggingViewIfNeeded"))
  {
    -[EKCalendarDate timeZone](self->_currentDay, "timeZone");
    v129 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0C420], "calendarDateWithAbsoluteTime:timeZone:", v129, self->_dateAtFirstTouchPoint);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "calendarDateForDay");
    v5 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue();
    currentDay = self->_currentDay;
    self->_currentDay = v5;

    -[UILongPressGestureRecognizer setState:](self->_draggingGestureRecognizer, "setState:", 3);
LABEL_3:

    return;
  }
  if (!self->_draggingView)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalendarEventGestures.m"), 2991, CFSTR("Gesture controller tried to commit, but with no view to drag. Cancelling instead."));

    -[EKEventGestureController _cancel](self, "_cancel");
    return;
  }
  if (-[EKEventGestureController commitBlocked](self, "commitBlocked"))
  {
    self->_needsCommit = 1;
    return;
  }
  self->_needsCommit = 0;
  if (self->_currentDraggingState != 3 && CFAbsoluteTimeGetCurrent() - self->_firstTouchTime < 0.2)
  {
    -[UILongPressGestureRecognizer setState:](self->_draggingGestureRecognizer, "setState:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    draggingView = self->_draggingView;
    -[EKEventGestureController event](self, "event");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "eventGestureController:addViewToScroller:isAllDay:", self, draggingView, objc_msgSend(v57, "isAllDay"));

    v129 = objc_loadWeakRetained((id *)&self->_delegate);
    -[EKEventGestureController event](self, "event");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "eventGestureController:didSingleTapOccurrence:shouldExtendSelection:", self, v58, 0);

    goto LABEL_3;
  }
  -[EKDayOccurrenceView occurrence](self->_draggingView, "occurrence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 88;
  if (self->_currentDragType == 1)
    v9 = 112;
  v10 = *(double *)((char *)&self->super.isa + v9);
  v11 = self->_latestTouchPoint.y - self->_touchOffset.y;
  -[EKDayOccurrenceView travelTimeSubviewHeightInPoints](self->_draggingView, "travelTimeSubviewHeightInPoints");
  v13 = v11 + v12;
  if (self->_currentDragType == 1 && !self->_dragLockDisabled && self->_horizontalDragLocked)
  {
    -[EKDayOccurrenceView frame](self->_draggingView, "frame", v13);
    v15 = v14;
    -[EKDayOccurrenceView travelTimeSubviewHeightInPoints](self->_draggingView, "travelTimeSubviewHeightInPoints");
    v13 = v15 + v16;
  }
  -[EKEventGestureController _capOccurrenceViewYOrigin:](self, "_capOccurrenceViewYOrigin:", v13);
  v18 = v17;
  v19 = objc_loadWeakRetained((id *)&self->_delegate);
  v20 = objc_msgSend(v19, "eventGestureController:isAllDayAtPoint:requireInsistence:", self, -[EKDayOccurrenceView isAllDay](self->_draggingView, "isAllDay") ^ 1, self->_latestTouchPoint.x, self->_latestTouchPoint.y);

  if (v20)
    v21 = self->_currentDragType == 1;
  else
    v21 = 0;
  v22 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v22, "eventGestureController:dateAtPoint:", self, v10, v18);
  v24 = v23;

  -[EKEvent travelTime](self->_event, "travelTime");
  v26 = v25;
  touchOffsetDays = self->_touchOffsetDays;
  if (touchOffsetDays <= 0 && self->_commitOffsetDays < 1)
  {
    v32 = v24;
    v45 = v24;
    if (v21)
      goto LABEL_23;
  }
  else
  {
    if (v21)
    {
      v28 = -(LODWORD(self->_commitOffsetDays) + touchOffsetDays);
      v145 = 0;
      v144 = 0;
      v146 = 0;
      objc_msgSend(v8, "eventStore");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeZone");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = 0;
      v143 = v28;
      CalAbsoluteTimeAddGregorianUnits();
      v32 = v31;

LABEL_23:
      v33 = (void *)MEMORY[0x1E0D0C420];
      objc_msgSend(v8, "eventStore");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "timeZone");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "calendarDateWithAbsoluteTime:timeZone:", v35, v32);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "calendarDateForDay");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "absoluteTime");
      v39 = v38;

      goto LABEL_26;
    }
    v40 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v40, "eventGestureController:dateAtPoint:", self, self->_latestTouchPoint.x, self->_latestTouchPoint.y);
    v42 = v41;

    objc_msgSend(v8, "startDate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "timeIntervalSinceReferenceDate");
    v45 = v44 + v42 - self->_dateAtFirstTouchPoint;

  }
  v39 = CalSnapDateTo15MinuteOr5MinuteInterval(v8, -[EKEventGestureController currentDragSnappingType](self, "currentDragSnappingType"), v45);
LABEL_26:
  objc_msgSend(v8, "duration");
  v47 = v46;
  objc_msgSend(v8, "endDateUnadjustedForLegacyClients");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "timeIntervalSinceReferenceDate");
  v50 = v49;

  currentDragType = self->_currentDragType;
  if (currentDragType)
  {
    if (currentDragType == 1)
    {
      v52 = v24 - v26;
      if (objc_msgSend(v8, "isAllDay") ^ 1 | v21)
      {
        v53 = objc_msgSend(v8, "isAllDay");
        v54 = 86399.0;
        if (!v21)
          v54 = v47;
        if (!v53)
          v47 = v54;
      }
      else
      {
        v47 = 3600.0;
      }
      v61 = v39;
    }
    else
    {
      -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", 0, 0, fmin(v47, 86400.0));
      v64 = round(v63);
      v65 = self->_latestTouchPoint.y - self->_touchOffset.y;
      -[EKDayOccurrenceView travelTimeSubviewHeightInPoints](self->_draggingView, "travelTimeSubviewHeightInPoints");
      v67 = v64 + v65 + v66;
      v68 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v68, "eventGestureController:dateAtPoint:", self, self->_firstTouchPoint.x, v67);
      v70 = v69;

      v71 = CalSnapDateTo15MinuteOr5MinuteInterval(v8, -[EKEventGestureController currentDragSnappingType](self, "currentDragSnappingType"), v70);
      if (v71 > v39)
      {
        v47 = v47 + v71 - v50;
        -[EKEventGestureController _minimumDuration](self, "_minimumDuration");
        if (v47 < v72)
        {
          -[EKEventGestureController _minimumDuration](self, "_minimumDuration");
          v47 = v73;
        }
      }
      objc_msgSend(v8, "startDate");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "timeIntervalSinceReferenceDate");
      v61 = v75;

      -[EKEvent travelTime](self->_event, "travelTime");
      v52 = v61 - v76;
    }
  }
  else
  {
    -[EKEventGestureController _minimumDuration](self, "_minimumDuration");
    v60 = v50 - v59;
    if (v39 <= v60)
      v61 = v39;
    else
      v61 = v60;
    -[EKEvent travelTime](self->_event, "travelTime");
    v52 = v61 - v62;
    v47 = v50 - v61;
    v39 = v61;
  }
  if (self->_currentDragType != 1)
  {
    v77 = (void *)objc_opt_class();
    -[EKDayOccurrenceView bounds](self->_draggingView, "bounds");
    objc_msgSend(v77, "contentStretchRectForFrame:");
    v79 = v78;
    v81 = v80;
    v83 = v82;
    v85 = v84;
    -[EKDayOccurrenceView layer](self->_draggingView, "layer");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setContentsCenter:", v79, v81, v83, v85);

    -[EKDayOccurrenceView setNeedsDisplay](self->_draggingView, "setNeedsDisplay");
  }
  v87 = fmin(v47, 86400.0);
  if (!-[EKEvent isAllDay](self->_event, "isAllDay"))
  {
    v88 = self->_touchOffsetDays;
    if (v88 >= 1 && v88 + 1 == objc_msgSend(v8, "daySpan"))
    {
      v89 = (void *)MEMORY[0x1E0D0C420];
      -[EKEvent endDateUnadjustedForLegacyClients](self->_event, "endDateUnadjustedForLegacyClients");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent timeZone](self->_event, "timeZone");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "calendarDateWithDate:timeZone:", v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v92, "absoluteTime");
      v94 = v93;
      objc_msgSend(v92, "calendarDateForDay");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "absoluteTime");
      v87 = v94 - v96;

    }
  }
  -[EKEventGestureController _computeWidthForOccurrenceView](self, "_computeWidthForOccurrenceView");
  v98 = v97;
  objc_msgSend(v8, "travelTime");
  v99 = 0.0;
  if (v100 > 0.0)
  {
    -[EKEvent travelTime](self->_event, "travelTime");
    -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", v8, v21);
    v99 = v101;
  }
  -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", v8, v21, v87);
  v103 = v102;
  -[EKDayOccurrenceView enoughHeightForOneLine](self->_draggingViewSource, "enoughHeightForOneLine");
  if (v103 >= v104)
    v105 = v103;
  else
    v105 = v104;
  -[EKEventGestureController _computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:](self, "_computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:", v21, 0, 1, self->_latestTouchPoint.x, self->_latestTouchPoint.y, CalSnapDateTo15MinuteOr5MinuteInterval(self->_event, -[EKEventGestureController currentDragSnappingType](self, "currentDragSnappingType"), v52));
  v107 = v106;
  v109 = v108;
  -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "travelTimeSubviewHeightInPoints");
  -[EKDayOccurrenceView setTravelTimeSubviewHeightInPoints:](self->_draggingView, "setTravelTimeSubviewHeightInPoints:");

  -[EKDayOccurrenceView occurrence](self->_draggingView, "occurrence");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setAllDay:", v21);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v61);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v112, "isEqualToDate:", v113) & 1) != 0)
  {

    -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayOccurrenceView setIsProposedTime:](self->_draggingView, "setIsProposedTime:", objc_msgSend(v114, "isProposedTime"));

    -[EKDayOccurrenceView requestContentIfNeeded:completion:](self->_draggingView, "requestContentIfNeeded:completion:", 16, 0);
  }
  else
  {
    v115 = objc_msgSend(v8, "isEditable");
    v116 = v115;
    v117 = v115 ^ 1;

    -[EKEventGestureController draggingViewSource](self, "draggingViewSource");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayOccurrenceView setIsProposedTime:](self->_draggingView, "setIsProposedTime:", objc_msgSend(v118, "isProposedTime") | v117);

    -[EKDayOccurrenceView requestContentIfNeeded:completion:](self->_draggingView, "requestContentIfNeeded:completion:", 16, 0);
    if ((v116 & 1) == 0)
    {
      v128 = objc_msgSend(v8, "serverSupportedProposeNewTime");
      v138[0] = MEMORY[0x1E0C809B0];
      v138[1] = 3221225472;
      v138[2] = __35__EKEventGestureController__commit__block_invoke;
      v138[3] = &unk_1E601CBA0;
      v138[4] = self;
      v139 = v8;
      v140 = v112;
      v141 = v128;
      -[EKEventGestureController promptUserForProposeNewTime:forEvent:whenFinished:](self, "promptUserForProposeNewTime:forEvent:whenFinished:", v140, v8, v138);

      goto LABEL_61;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v61);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStartDate:", v119);

  objc_msgSend(v8, "startDate");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "dateByAddingTimeInterval:", v47);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEndDateUnadjustedForLegacyClients:", v121);

  v122 = self->_dragSnappingFeedback;
  dragSnappingFeedback = self->_dragSnappingFeedback;
  self->_dragSnappingFeedback = 0;

  v124 = !self->_dragInteractionCancellingWithoutDragging;
  v125 = (void *)MEMORY[0x1E0DC3F10];
  v137[0] = MEMORY[0x1E0C809B0];
  v137[1] = 3221225472;
  v137[2] = __35__EKEventGestureController__commit__block_invoke_157;
  v137[3] = &unk_1E601AA08;
  v137[5] = v107;
  v137[6] = v109;
  v137[7] = v98;
  *(double *)&v137[8] = v99 + v105;
  v137[4] = self;
  v130[0] = MEMORY[0x1E0C809B0];
  v130[1] = 3221225472;
  v130[2] = __35__EKEventGestureController__commit__block_invoke_2;
  v130[3] = &unk_1E601CBF0;
  v135 = v124;
  v131 = v122;
  v132 = self;
  v133 = v8;
  v134 = v39;
  v136 = v21;
  v126 = v8;
  v127 = v122;
  objc_msgSend(v125, "animateWithDuration:delay:options:animations:completion:", 4, v137, v130, 0.1, 0.0);

LABEL_61:
}

void __35__EKEventGestureController__commit__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  EKUIEmailCompositionManager *v26;
  void *v27;
  void *v28;
  void *v29;
  EKUIEmailCompositionManager *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  uint8_t buf[4];
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 344));
  objc_msgSend(WeakRetained, "eventGestureController:didCancelEditingOccurrence:fadedOut:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);

  objc_msgSend(*(id *)(a1 + 32), "removeDraggedOccurrence");
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setEvent:", 0);
    if (objc_msgSend(*(id *)(a1 + 40), "participationStatus") != 2
      && objc_msgSend(*(id *)(a1 + 40), "participationStatus") != 4)
    {
      objc_msgSend(*(id *)(a1 + 40), "setInvitationStatus:", 0);
      objc_msgSend(*(id *)(a1 + 40), "setParticipationStatus:", 4);
    }
    objc_msgSend(*(id *)(a1 + 40), "setProposedStartDate:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "editorForEventGestureController:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 56))
    {
      v7 = (void *)MEMORY[0x1E0D0CD90];
      v9 = *(void **)(a1 + 40);
      v8 = (id *)(a1 + 40);
      objc_msgSend(v9, "responseComment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v8, "proposedStartDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v8, "timeZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "comment:withInsertedAutoCommentForDate:timeZone:", v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v8, "setResponseComment:", v13);

      v14 = *v8;
      v43 = 0;
      LOBYTE(v8) = objc_msgSend(v6, "saveEvent:span:error:", v14, 0, &v43);
      v15 = v43;
      if ((v8 & 1) == 0)
      {
        v16 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v15;
          _os_log_impl(&dword_1AF84D000, v16, OS_LOG_TYPE_ERROR, "Failed to save proposed time with response comment: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      EventKitUIBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("NEW TIME PROPOSAL:"), &stru_1E601DFA8, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0CB3940];
      EventKitUIBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Can we move this event to <b>%@</b>?"), &stru_1E601DFA8, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0D0C2B0];
      v22 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "timeZone");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "longStringForDateAndTime:inTimeZone:", v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringWithFormat:", v20, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = [EKUIEmailCompositionManager alloc];
      v27 = *(void **)(a1 + 40);
      objc_msgSend(v27, "organizer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[EKUIEmailCompositionManager initWithEvent:participantRecipients:subjectPrefix:bodyPrefix:](v26, "initWithEvent:participantRecipients:subjectPrefix:bodyPrefix:", v27, v29, v15, v25);
      objc_msgSend(*(id *)(a1 + 32), "setMessageSendingManager:", v30);

      objc_msgSend(*(id *)(a1 + 32), "messageSendingManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, v31);

      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __35__EKEventGestureController__commit__block_invoke_155;
      v39[3] = &unk_1E601CB78;
      objc_copyWeak(&v42, (id *)buf);
      v40 = *(id *)(a1 + 40);
      v41 = v6;
      objc_msgSend(*(id *)(a1 + 32), "messageSendingManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setMessageSendingComplete:", v39);

      objc_msgSend(*(id *)(a1 + 32), "messageSendingManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "viewController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setModalPresentationStyle:", 2);

      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "currentPresentationController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "messageSendingManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "viewController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "presentViewController:animated:completion:", v38, 1, 0);

      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)buf);

    }
  }
}

void __35__EKEventGestureController__commit__block_invoke_155(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ((a2 & 1) != 0)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(a1 + 40);
      v13 = 0;
      v7 = objc_msgSend(v5, "saveEvent:span:error:", v6, 0, &v13);
      v8 = v13;
      if ((v7 & 1) == 0)
      {
        v9 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v8;
          _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_ERROR, "Failed to save proposed time: %@", buf, 0xCu);
        }
      }

    }
    else
    {
      v10 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_ERROR, "Failed to send email", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "rollback");
    }
    objc_msgSend(WeakRetained, "viewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentingViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

void __35__EKEventGestureController__commit__block_invoke_157(double *a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  _OWORD v21[3];

  v2 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  v5 = a1[8];
  objc_msgSend(*(id *)(*((_QWORD *)a1 + 4) + 56), "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)a1 + 4) + 344));
    objc_msgSend(WeakRetained, "occurrenceViewSuperviewForEventGestureController:", *((_QWORD *)a1 + 4));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*((_QWORD *)a1 + 4) + 56), "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertRect:fromView:", v8, a1[5], a1[6], a1[7], a1[8]);
    v2 = v10;
    v3 = v11;
    v4 = v12;
    v5 = v13;

  }
  v14 = *(void **)(*((_QWORD *)a1 + 4) + 56);
  v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v21[0] = *MEMORY[0x1E0C9BAA8];
  v21[1] = v15;
  v21[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v14, "setTransform:", v21);
  objc_msgSend(*(id *)(*((_QWORD *)a1 + 4) + 56), "setFrame:", v2, v3, v4, v5);
  v16 = *((_QWORD *)a1 + 4);
  if (!*(_BYTE *)(v16 + 264))
  {
    v17 = *MEMORY[0x1E0C9D820];
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    objc_msgSend(*(id *)(v16 + 56), "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setShadowOffset:", v17, v18);

    objc_msgSend(*(id *)(*((_QWORD *)a1 + 4) + 56), "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setShadowRadius:", 0.0);

  }
}

void __35__EKEventGestureController__commit__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  char v3;
  id WeakRetained;
  char v5;
  id v6;
  int v7;
  void *v8;
  _OWORD *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  char v14;
  id v15;
  uint64_t v16;
  _BOOL4 IsCompactInViewHierarchy;
  uint64_t v18;
  int v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "draggedObjectLanded");
  objc_msgSend(*(id *)(a1 + 32), "userInteractionEnded");
  v2 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v2 + 200))
  {
    v3 = objc_msgSend(*(id *)(a1 + 48), "hasChanges");
    v2 = *(_QWORD *)(a1 + 40);
    if ((v3 & 1) == 0 && !*(_BYTE *)(v2 + 264))
      goto LABEL_26;
  }
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 344));
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 344));
    v7 = objc_msgSend(v6, "eventEditorPopoverActiveWhileDraggingForEventGestureController:", *(_QWORD *)(a1 + 40)) ^ 1;

  }
  else
  {
    v7 = 1;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "hasRecurrenceRules")
    && objc_msgSend(*(id *)(a1 + 48), "isAllDayDirty"))
  {
    objc_msgSend(*(id *)(a1 + 48), "rollback");
    objc_msgSend(*(id *)(a1 + 40), "updateDraggingOccurrenceForced:animated:", 1, 0);
LABEL_25:
    v2 = *(_QWORD *)(a1 + 40);
LABEL_26:
    objc_msgSend((id)v2, "_cancel");
    return;
  }
  objc_msgSend(*(id *)(a1 + 48), "singleRecurrenceRule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v7 = 0;

  v9 = *(_OWORD **)(a1 + 40);
  if (v7 == 1)
  {
    v10 = *(void **)(a1 + 48);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __35__EKEventGestureController__commit__block_invoke_3;
    v21[3] = &unk_1E601CBC8;
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 40);
    v22 = v11;
    v23 = v12;
    v24 = *(_QWORD *)(a1 + 56);
    v25 = *(_BYTE *)(a1 + 65);
    objc_msgSend(v9, "promptUserForRecurrenceActionOnOccurrence:whenFinished:", v11, v21);

    return;
  }
  *(_OWORD *)((char *)v9 + 88) = v9[7];
  v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 344));
  v14 = objc_msgSend(v13, "eventGestureController:didCommitOccurrence:toDate:isAllDay:span:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 65), 0, *(double *)(a1 + 56));

  v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 344));
  objc_msgSend(v15, "eventGestureController:addViewToScroller:isAllDay:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), objc_msgSend(*(id *)(a1 + 48), "isAllDay"));

  v16 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v16 + 202) && *(_QWORD *)(v16 + 176)
    || (IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy(*(void **)(v16 + 56)),
        v18 = *(_QWORD *)(a1 + 40),
        IsCompactInViewHierarchy)
    && *(_BYTE *)(v18 + 200)
    || (v19 = objc_msgSend(*(id *)(v18 + 56), "isHidden"), v20 = *(_QWORD *)(a1 + 40), v19) && *(_BYTE *)(v20 + 45))
  {
    if ((v14 & 1) == 0)
      goto LABEL_25;
  }
  else
  {
    objc_msgSend(*(id *)(v20 + 56), "setDrawsResizeHandles:", 1);
    if ((v14 & 1) == 0)
      goto LABEL_25;
  }
}

void __35__EKEventGestureController__commit__block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id WeakRetained;
  char v18;
  id v19;
  uint64_t v20;

  if ((a2 & 1) != 0)
    goto LABEL_13;
  if (a3
    && objc_msgSend(*(id *)(a1 + 32), "hasRecurrenceRules")
    && objc_msgSend(*(id *)(a1 + 32), "isMainOccurrence"))
  {
    objc_msgSend(*(id *)(a1 + 32), "recurrenceRules");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "recurrenceEnd");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "committedValueForKey:", CFSTR("startDate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceReferenceDate");
      v11 = v10;

      objc_msgSend(*(id *)(a1 + 32), "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v14 = v13;

      objc_msgSend(v8, "dateByAddingTimeInterval:", v14 - v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CAA108], "recurrenceEndWithEndDate:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRecurrenceEnd:", v16);

    }
  }
  *(_OWORD *)(*(_QWORD *)(a1 + 40) + 88) = *(_OWORD *)(*(_QWORD *)(a1 + 40) + 112);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 344));
  v18 = objc_msgSend(WeakRetained, "eventGestureController:didCommitOccurrence:toDate:isAllDay:span:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), a3, *(double *)(a1 + 48));

  v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 344));
  objc_msgSend(v19, "eventGestureController:addViewToScroller:isAllDay:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), objc_msgSend(*(id *)(a1 + 32), "isAllDay"));

  v20 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v20 + 202) && *(_QWORD *)(v20 + 176))
  {
    if ((v18 & 1) != 0)
      return;
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "rollback");
    objc_msgSend(*(id *)(a1 + 40), "updateDraggingOccurrenceForced:animated:", 1, 0);
    objc_msgSend(*(id *)(a1 + 40), "_cancel");
    return;
  }
  objc_msgSend(*(id *)(v20 + 56), "setDrawsResizeHandles:", 1);
  if ((v18 & 1) == 0)
    goto LABEL_13;
}

- (void)_cancel
{
  double v3;
  double v4;
  void *v5;
  int v6;
  id WeakRetained;
  id v8;
  EKEvent *v9;

  v9 = self->_event;
  -[EKDayOccurrenceView alpha](self->_draggingView, "alpha");
  v4 = v3;
  if (v3 == 0.0)
  {
    -[EKEventGestureController event](self, "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isNew");

    if (v6)
      -[EKEventGestureController removeDraggedOccurrence](self, "removeDraggedOccurrence");
    -[EKEventGestureController setEvent:](self, "setEvent:", 0);
  }
  else if (self->_draggingView)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "eventGestureController:addViewToScroller:isAllDay:", self, self->_draggingView, -[EKEvent isAllDay](v9, "isAllDay"));

  }
  v8 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v8, "eventGestureController:didCancelEditingOccurrence:fadedOut:", self, v9, v4 == 0.0);

}

- (BOOL)_flingOrCancelDraggingViewIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double dateAtFirstTouchPoint;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  __double2 v33;
  double *v34;
  double v35;
  double v36;
  void *v37;
  id WeakRetained;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  int v46;
  id v47;
  id v48;
  int v49;
  double v50;
  double v51;
  double v52;
  double v53;
  EKDayOccurrenceView *draggingView;
  uint64_t v55;
  _UIDragSnappingFeedbackGenerator *v56;
  _UIDragSnappingFeedbackGenerator *dragSnappingFeedback;
  void *v58;
  id *v59;
  double *v60;
  double v61;
  double v62;
  double v63;
  __double2 v64;
  double v65;
  int64_t touchOffsetDays;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  double *v77;
  double v78;
  id v79;
  char v80;
  double v81;
  double v82;
  id v83;
  double v84;
  double v85;
  double v86;
  double v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  double v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  double v95;
  uint64_t v96;
  double v97;
  double v98;
  uint64_t v99;
  void *v100;
  double v101;
  double v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD v105[5];
  id v106;
  _UIDragSnappingFeedbackGenerator *v107;
  uint64_t v108;
  double v109;
  double v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  double v114;
  uint64_t v115;
  uint64_t v116;
  BOOL v117;
  _QWORD v118[9];
  _QWORD v119[5];
  _UIDragSnappingFeedbackGenerator *v120;
  _QWORD v121[6];
  uint64_t v122;
  double *v123;
  uint64_t v124;
  const char *v125;
  __int128 v126;
  __int128 v127;
  _QWORD v128[6];

  v3 = self->_latestTouchPoint.x - self->_previousTouchPoint.x;
  v4 = self->_latestTouchPoint.y - self->_previousTouchPoint.y;
  v5 = sqrt(v4 * v4 + v3 * v3);
  v6 = v5 * 0.7 / (CFAbsoluteTimeGetCurrent() - self->_previousTouchTime) + self->_previousTouchVelocity * 0.3;
  if (v6 <= 6000.0)
    v7 = v6;
  else
    v7 = 6000.0;
  v8 = -[EKEventGestureController _isPointInCancelRegion:](self, "_isPointInCancelRegion:", self->_latestTouchPoint.x, self->_latestTouchPoint.y);
  v9 = v8;
  if (v7 <= 1000.0)
  {
    if (!v8)
      return 0;
  }
  else if (self->_currentDragType != 1 && !v8)
  {
    return 0;
  }
  -[EKDayOccurrenceView occurrence](self->_draggingView, "occurrence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent duration](self->_event, "duration");
  v13 = v12;
  v14 = (void *)MEMORY[0x1E0D0C420];
  dateAtFirstTouchPoint = self->_dateAtFirstTouchPoint;
  objc_msgSend(v11, "eventStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "calendarDateWithAbsoluteTime:timeZone:", v17, dateAtFirstTouchPoint);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_touchOffsetDays <= 0)
  {
    objc_msgSend(v11, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  }
  else
  {
    objc_msgSend(v18, "calendarDateForDay");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "absoluteTime");
  }
  v21 = v20;
  v22 = fmin(v13, 86400.0);

  -[EKEventGestureController _computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:](self, "_computeOriginAtTouchPoint:forDate:isAllDay:allowXOffset:allowFloorAtRegionBottom:", objc_msgSend(v11, "isAllDay"), 0, 0, self->_firstTouchPoint.x, self->_firstTouchPoint.y, v21);
  v24 = v23;
  v26 = v25;
  if (self->_currentDragType == 1)
  {
    v27 = acos(v3 / v5);
    v122 = 0;
    v123 = (double *)&v122;
    v124 = 0x4010000000;
    v125 = "";
    v126 = 0u;
    v127 = 0u;
    -[EKDayOccurrenceView frame](self->_draggingView, "frame");
    *(_QWORD *)&v126 = v28;
    *((_QWORD *)&v126 + 1) = v29;
    *(_QWORD *)&v127 = v30;
    *((_QWORD *)&v127 + 1) = v31;
    v32 = v7 / 20.0;
    v33 = __sincos_stret(v27);
    v34 = v123;
    v35 = v123[5];
    v36 = -1.0;
    if (v4 > 0.0)
      v36 = 1.0;
    v123[4] = v123[4] + v32 * v33.__cosval;
    v34[5] = v35 + v32 * v33.__sinval * v36;
    v37 = (void *)MEMORY[0x1E0D0C420];
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "eventGestureController:dateAtPoint:", self, self->_firstTouchPoint.x, self->_firstTouchPoint.y);
    v40 = v39;
    objc_msgSend(v11, "eventStore");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "timeZone");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "calendarDateWithAbsoluteTime:timeZone:", v42, v40);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "calendarDateForDay");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "calendarDateForDay");
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    v47 = objc_loadWeakRetained((id *)&self->_delegate);
    LOBYTE(v45) = objc_opt_respondsToSelector();

    if ((v45 & 1) != 0)
    {
      v48 = objc_loadWeakRetained((id *)&self->_delegate);
      v49 = objc_msgSend(v48, "eventGestureController:shouldFadeOccurrenceAfterFling:", self, v11);

    }
    else if (v46)
    {
      if (objc_msgSend(v11, "isNew"))
        v49 = !self->_forcedStart;
      else
        v49 = 0;
    }
    else
    {
      v49 = 1;
    }
    v56 = self->_dragSnappingFeedback;
    dragSnappingFeedback = self->_dragSnappingFeedback;
    self->_dragSnappingFeedback = 0;

    if (v49)
    {
      -[EKDayOccurrenceView setDrawsResizeHandles:](self->_draggingView, "setDrawsResizeHandles:", 0);
      v58 = (void *)MEMORY[0x1E0DC3F10];
      v121[0] = MEMORY[0x1E0C809B0];
      v121[1] = 3221225472;
      v121[2] = __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_2;
      v121[3] = &unk_1E601A950;
      v121[4] = self;
      v121[5] = &v122;
      v119[0] = MEMORY[0x1E0C809B0];
      v119[1] = 3221225472;
      v119[2] = __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_3;
      v119[3] = &unk_1E601CC18;
      v119[4] = self;
      v120 = v56;
      objc_msgSend(v58, "animateWithDuration:delay:options:animations:completion:", 0x20000, v121, v119, 0.16, 0.0);
      v59 = (id *)&v120;
    }
    else
    {
      v60 = v123;
      v61 = v123[4];
      v101 = v123[5];
      v62 = sqrt((v101 - v26) * (v101 - v26) + (v61 - v24) * (v61 - v24));
      v63 = acos((v61 - v24) / v62);
      v103 = *((_QWORD *)v60 + 7);
      v104 = *((_QWORD *)v60 + 6);
      v64 = __sincos_stret(v63);
      if (v101 - v26 <= 0.0)
        v65 = -1.0;
      else
        v65 = 1.0;
      if (!-[EKEvent isAllDay](self->_event, "isAllDay", *(_QWORD *)&v101))
      {
        touchOffsetDays = self->_touchOffsetDays;
        if (touchOffsetDays >= 1 && touchOffsetDays + 1 == objc_msgSend(v11, "daySpan"))
        {
          v67 = (void *)MEMORY[0x1E0D0C420];
          -[EKEvent endDateUnadjustedForLegacyClients](self->_event, "endDateUnadjustedForLegacyClients");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKEvent timeZone](self->_event, "timeZone");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "calendarDateWithDate:timeZone:", v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v70, "absoluteTime");
          v72 = v71;
          objc_msgSend(v70, "calendarDateForDay");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "absoluteTime");
          v22 = v72 - v74;

        }
      }
      -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", v11, objc_msgSend(v11, "isAllDay"), v22);
      v76 = v75;
      v77 = v123;
      v78 = v123[5] + v64.__sinval * (v62 * -0.2) * v65;
      v123[4] = v123[4] + v62 * -0.2 * v64.__cosval;
      v77[5] = v78;
      v79 = objc_loadWeakRetained((id *)&self->_delegate);
      v80 = objc_opt_respondsToSelector();
      v81 = v62 * -1.08;
      v82 = v61 + v62 * -1.08 * v64.__cosval;

      if ((v80 & 1) != 0
        && (v83 = objc_loadWeakRetained((id *)&self->_delegate),
            objc_msgSend(v83, "pageChangeMarginsForEventGestureController:", self),
            v85 = v84,
            v87 = v86,
            v83,
            fabs(v85) < 2.22044605e-16))
      {
        v89 = v103;
        v88 = v104;
        v90 = v102;
        if (fabs(v87) < 2.22044605e-16)
        {
          v123[4] = v24;
          v82 = v24;
        }
      }
      else
      {
        v89 = v103;
        v88 = v104;
        v90 = v102;
      }
      v91 = v90 + v64.__sinval * v81 * v65;
      if (v9)
      {
        v92 = v89;
        v89 = v76;
        v93 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
        v76 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
        v94 = v82;
        v82 = v24;
        v24 = *MEMORY[0x1E0C9D648];
        v95 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v96 = 0x3FBEB851EB851EB8;
        v97 = 0.192;
        v98 = v91;
        v99 = v88;
      }
      else
      {
        v94 = v123[4];
        v98 = v123[5];
        v99 = *((_QWORD *)v123 + 6);
        v92 = *((_QWORD *)v123 + 7);
        v96 = 0x3FC89374BC6A7EFALL;
        v97 = 0.16;
        v95 = v26;
        v93 = v88;
        v26 = v91;
      }
      v100 = (void *)MEMORY[0x1E0DC3F10];
      v118[0] = MEMORY[0x1E0C809B0];
      v118[1] = 3221225472;
      v118[2] = __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_4;
      v118[3] = &unk_1E601AA08;
      v118[4] = self;
      *(double *)&v118[5] = v94;
      *(double *)&v118[6] = v98;
      v118[7] = v99;
      v118[8] = v92;
      v105[0] = MEMORY[0x1E0C809B0];
      v105[1] = 3221225472;
      v105[2] = __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_5;
      v105[3] = &unk_1E601CC68;
      v105[4] = self;
      v108 = v96;
      v109 = v82;
      v110 = v26;
      v111 = v88;
      v112 = v89;
      v117 = v9;
      v106 = v11;
      v113 = v24;
      v114 = v95;
      v115 = v93;
      v116 = v76;
      v107 = v56;
      objc_msgSend(v100, "animateWithDuration:delay:options:animations:completion:", 0x20000, v118, v105, v97, 0.0);
      v59 = &v106;

    }
    _Block_object_dispose(&v122, 8);
  }
  else
  {
    -[EKDayOccurrenceView frame](self->_draggingView, "frame");
    v51 = v50;
    -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", v11, objc_msgSend(v11, "isAllDay"), v22);
    v53 = v52;
    draggingView = self->_draggingView;
    v55 = objc_msgSend(v11, "isAllDay");
    v128[0] = MEMORY[0x1E0C809B0];
    v128[1] = 3221225472;
    v128[2] = __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke;
    v128[3] = &unk_1E6018688;
    v128[4] = self;
    -[EKDayOccurrenceView animateToFrame:isAllDay:beginFromCurrentState:whenFinished:](draggingView, "animateToFrame:isAllDay:beginFromCurrentState:whenFinished:", v55, 0, v128, v24, v26, v51, v53);
  }

  return 1;
}

uint64_t __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

uint64_t __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setAlpha:", 0.0);
}

uint64_t __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancel");
  objc_msgSend(*(id *)(a1 + 40), "draggedObjectLanded");
  return objc_msgSend(*(id *)(a1 + 40), "userInteractionEnded");
}

uint64_t __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_5(uint64_t a1)
{
  void *v2;
  double v3;
  __int128 v4;
  void *v5;
  __int128 v6;
  _QWORD v7[5];
  id v8;
  id v9;
  __int128 v10;
  __int128 v11;
  char v12;
  _QWORD v13[4];
  uint64_t v14;
  __int128 v15;
  __int128 v16;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v3 = *(double *)(a1 + 56);
  v13[0] = MEMORY[0x1E0C809B0];
  v4 = *(_OWORD *)(a1 + 80);
  v15 = *(_OWORD *)(a1 + 64);
  v13[1] = 3221225472;
  v13[2] = __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_6;
  v13[3] = &unk_1E601AA08;
  v5 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 32);
  v16 = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_7;
  v7[3] = &unk_1E601CC40;
  v12 = *(_BYTE *)(a1 + 128);
  v7[4] = v14;
  v8 = v5;
  v6 = *(_OWORD *)(a1 + 112);
  v10 = *(_OWORD *)(a1 + 96);
  v11 = v6;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "animateWithDuration:delay:options:animations:completion:", 0, v13, v7, v3, 0.0);

}

uint64_t __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_7(uint64_t a1)
{
  int v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  v2 = *(unsigned __int8 *)(a1 + 88);
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (!*(_BYTE *)(v3 + 202) || !*(_QWORD *)(v3 + 176))
    {
      objc_msgSend(*(id *)(v3 + 56), "setDrawsResizeHandles:", 1);
      v3 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend((id)v3, "_cancel");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 344));
    objc_msgSend(WeakRetained, "eventGestureController:adjustDraggingView:forAllDay:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), objc_msgSend(*(id *)(a1 + 40), "isAllDay"));

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    v6 = objc_msgSend(*(id *)(a1 + 40), "isAllDay");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_8;
    v7[3] = &unk_1E6018EC0;
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v5, "animateToFrame:isAllDay:beginFromCurrentState:whenFinished:", v6, 0, v7, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  }
}

uint64_t __62__EKEventGestureController__flingOrCancelDraggingViewIfNeeded__block_invoke_8(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 202) || !*(_QWORD *)(v2 + 176))
  {
    objc_msgSend(*(id *)(v2 + 56), "setDrawsResizeHandles:", 1);
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend((id)v2, "_cancel");
  objc_msgSend(*(id *)(a1 + 40), "draggedObjectLanded");
  return objc_msgSend(*(id *)(a1 + 40), "userInteractionEnded");
}

- (double)_allDayBottomPadding
{
  id WeakRetained;
  _BOOL4 IsRegularInViewHierarchy;
  double result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(WeakRetained);

  result = 3.0;
  if (IsRegularInViewHierarchy)
    return 4.0;
  return result;
}

- (double)_alignedYOriginForAllDayOccurrence:(id)a3 atPoint:(CGPoint)a4 floorAtAllDayRegionBottom:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  id v9;
  id WeakRetained;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "eventGestureController:yPositionPerhapsMatchingAllDayOccurrence:atPoint:", self, v9, x, y);
  v12 = v11;

  if (v5)
  {
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v13, "timedRegionOriginForEventGestureController:", self);
    v15 = v14;

    -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", v9, 1, 3600.0);
    v17 = v16;
    v18 = v12 + v16;
    -[EKEventGestureController _allDayBottomPadding](self, "_allDayBottomPadding");
    if (v18 + v19 >= v15)
    {
      -[EKEventGestureController _allDayBottomPadding](self, "_allDayBottomPadding");
      v12 = v15 - v17 - v20;
    }
  }

  return v12;
}

- (double)_capOccurrenceViewYOrigin:(double)a3
{
  id WeakRetained;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "touchTrackingViewForEventGestureController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventGestureController _minimumDuration](self, "_minimumDuration");
  -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", 0, 0);
  v8 = v7;
  objc_msgSend(v6, "frame");
  v10 = round(v9 - v8);
  if (v10 <= a3)
    a3 = v10;

  return a3;
}

- (void)_updateHorizontalDragLockForPoint:(CGPoint)a3
{
  double y;

  y = self->_firstTouchPoint.y;
  if (vabdd_f64(a3.y, y) <= 20.0)
  {
    if (!self->_dragLockDisabled)
      self->_horizontalDragLocked = atan(fabs((a3.y - y) / (a3.x - self->_firstTouchPoint.x))) < 0.174532925;
  }
  else
  {
    *(_WORD *)&self->_horizontalDragLocked = 256;
  }
}

- (double)_computeWidthForOccurrenceView
{
  int64_t v3;
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (-[EKEvent isAllDay](self->_event, "isAllDay")
    && !-[EKEventGestureController splitMultiDays](self, "splitMultiDays"))
  {
    v3 = -[EKEvent daySpan](self->_event, "daySpan");
  }
  else
  {
    v3 = 1;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "eventGestureController:widthForOccurrenceViewOfDays:", self, v3);
  v6 = v5;

  -[EKDayOccurrenceView margin](self->_draggingView, "margin");
  v8 = v6 - v7;
  -[EKDayOccurrenceView margin](self->_draggingView, "margin");
  return v8 - v9;
}

- (double)_computeHeightForOccurrenceViewOfDuration:(double)a3 event:(id)a4 allDay:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  double v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v25[2];

  v5 = a5;
  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "eventGestureController:occurrenceViewForOccurrence:occurrenceDate:", self, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "eventGestureController:heightForAllDayOccurrenceView:", self, v11);
    v14 = v13;

  }
  else if (objc_msgSend(v8, "isIntegrationEvent"))
  {
    v25[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_loadWeakRetained((id *)&self->_targetView);
    +[EKDayOccurrenceView enoughHeightForOneLineForEvents:usingSmallText:sizeClass:](EKDayOccurrenceView, "enoughHeightForOneLineForEvents:usingSmallText:sizeClass:", v15, 0, EKUIWidthSizeClassForViewHierarchy(v16));
    v14 = v17;

  }
  else
  {
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v18, "eventGestureController:heightForOccurrenceViewOfDuration:", self, a3);
    v20 = v19;

    -[EKDayOccurrenceView margin](self->_draggingView, "margin");
    v22 = v20 - v21;
    -[EKDayOccurrenceView margin](self->_draggingView, "margin");
    v14 = v22 - v23;
  }

  return v14;
}

- (CGPoint)_computeOriginAtTouchPoint:(CGPoint)a3 forDate:(double)a4 isAllDay:(BOOL)a5 allowXOffset:(BOOL)a6 allowFloorAtRegionBottom:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  _BOOL8 v9;
  double y;
  double x;
  EKEventGestureControllerDelegate **p_delegate;
  id WeakRetained;
  void *v16;
  id v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  id v29;
  int v30;
  double v31;
  double touchOffsetDays;
  double v33;
  id v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  double v43;
  double v44;
  int64_t v45;
  int v46;
  double v47;
  int IsLeftToRight;
  double v49;
  double v50;
  id v51;
  uint64_t v52;
  double v53;
  double v54;
  int64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  int v67;
  id v68;
  int v69;
  _BOOL4 v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  id v79;
  double v80;
  double v81;
  int v82;
  double v83;
  double v84;
  CGPoint result;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  y = a3.y;
  x = a3.x;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "occurrenceViewSuperviewForEventGestureController:", self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v17, "touchTrackingViewForEventGestureController:", self);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v19, "eventGestureController:widthForOccurrenceViewOfDays:", self, 1);
  v21 = v20;

  v22 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v22, "eventGestureController:pointAtDate:isAllDay:", self, v9, a4);
  v25 = CalRoundPointToScreenScale(v23, v24);
  v27 = v26;

  v28 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v29 = objc_loadWeakRetained((id *)p_delegate);
    v30 = objc_msgSend(v29, "moreThanOneDayVisibleForEventGestureController:", self);

  }
  else
  {
    v30 = 0;
  }

  if (!v9)
  {
    -[EKEventGestureController _updateHorizontalDragLockForPoint:](self, "_updateHorizontalDragLockForPoint:", self->_latestTouchPoint.x, self->_latestTouchPoint.y);
    if (self->_horizontalDragLocked && !self->_dragLockDisabled)
    {
      v27 = self->_firstTouchPoint.y - self->_touchOffset.y;
      if (!v7)
        goto LABEL_12;
    }
    else if (!v7)
    {
LABEL_12:
      if (self->_touchOffsetDays >= 1 && !-[EKEvent isAllDay](self->_event, "isAllDay"))
      {
        v34 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v34, "eventGestureController:dateAtPoint:", self, x, y);
        v36 = v35;

        v37 = (void *)MEMORY[0x1E0D0C420];
        -[EKEvent eventStore](self->_event, "eventStore");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "timeZone");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "calendarDateWithAbsoluteTime:timeZone:", v39, v36);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "calendarDateForDay");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v41, "absoluteTime");
        objc_msgSend(v42, "eventGestureController:pointAtDate:isAllDay:", self, 0);
        v25 = CalRoundPointToScreenScale(v43, v44);

      }
      goto LABEL_23;
    }
    -[EKEventGestureController _capOccurrenceViewYOrigin:](self, "_capOccurrenceViewYOrigin:", v27);
    v27 = v33;
    goto LABEL_12;
  }
  -[EKEventGestureController _alignedYOriginForAllDayOccurrence:atPoint:floorAtAllDayRegionBottom:](self, "_alignedYOriginForAllDayOccurrence:atPoint:floorAtAllDayRegionBottom:", self->_event, v7, x, y);
  v27 = v31;
  if (v8 && (-[EKEvent isAllDay](self->_event, "isAllDay") & v30) == 1)
  {
    touchOffsetDays = (double)self->_touchOffsetDays;
  }
  else
  {
    v45 = self->_touchOffsetDays;
    if (v45 > 0)
      v46 = v30;
    else
      v46 = 0;
    if (v46 != 1)
      goto LABEL_23;
    touchOffsetDays = (double)v45;
  }
  v47 = v21 * touchOffsetDays;
  IsLeftToRight = CalTimeDirectionIsLeftToRight();
  v49 = 1.0;
  if (IsLeftToRight)
    v49 = -1.0;
  v25 = v25 + v47 * v49;
LABEL_23:
  if (-[EKEventGestureController _isPointInCancelRegion:](self, "_isPointInCancelRegion:", x, y)
    && self->_currentDragType == 1)
  {
    if (self->_draggingView && -[UILongPressGestureRecognizer state](self->_draggingGestureRecognizer, "state"))
    {
      v50 = self->_touchOffset.y;
      v51 = objc_loadWeakRetained((id *)p_delegate);
      v52 = objc_msgSend(v51, "eventGestureController:isAllDayAtPoint:requireInsistence:", self, -[EKDayOccurrenceView isAllDay](self->_draggingView, "isAllDay") ^ 1, self->_firstTouchPoint.x, self->_firstTouchPoint.y);

      if ((_DWORD)v52 != v9)
      {
        -[EKEvent duration](self->_event, "duration");
        v54 = fmin(v53, 86400.0);
        if (!-[EKEvent isAllDay](self->_event, "isAllDay"))
        {
          v55 = self->_touchOffsetDays;
          if (v55 >= 1 && v55 + 1 == -[EKEvent daySpan](self->_event, "daySpan"))
          {
            v56 = (void *)MEMORY[0x1E0D0C420];
            -[EKEvent endDateUnadjustedForLegacyClients](self->_event, "endDateUnadjustedForLegacyClients");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKEvent timeZone](self->_event, "timeZone");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "calendarDateWithDate:timeZone:", v57, v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v59, "absoluteTime");
            v61 = v60;
            objc_msgSend(v59, "calendarDateForDay");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "absoluteTime");
            v54 = v61 - v63;

          }
        }
        -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", self->_event, v52, fmin(v54, 86400.0));
        v65 = v64;
        if ((v52 & 1) != 0)
          v66 = 3600.0;
        else
          -[EKEvent duration](self->_event, "duration");
        -[EKEventGestureController _computeHeightForOccurrenceViewOfDuration:event:allDay:](self, "_computeHeightForOccurrenceViewOfDuration:event:allDay:", self->_event, v9, v66);
        v50 = v50 * (v84 / v65);
      }
      v67 = 0;
      v27 = y - v50;
    }
    else
    {
      v67 = 0;
    }
  }
  else
  {
    v67 = 1;
  }
  if (v8)
  {
    v68 = objc_loadWeakRetained((id *)p_delegate);
    v69 = objc_opt_respondsToSelector();

    v70 = ((v67 | v69 ^ 1) & 1) == 0
       && -[EKEventGestureController usesXDragOffsetInCancelRegion](self, "usesXDragOffsetInCancelRegion");
    if (((v69 ^ 1 | v70) & 1) == 0)
    {
      v79 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v79, "computeXDragOffsetForEventGestureController:currentX:startX:", self, x, self->_firstTouchPoint.x);
      v81 = v80;
      v82 = CalTimeDirectionIsLeftToRight();
      v83 = -1.0;
      if (v82)
        v83 = 1.0;
      v25 = v25 + v81 * v83;

      if (!v9)
        goto LABEL_42;
      goto LABEL_43;
    }
    v25 = x - self->_touchOffset.x;
  }
  if (!v9)
  {
LABEL_42:
    -[EKDayOccurrenceView margin](self->_draggingView, "margin");
    v25 = v25 + v71;
    -[EKDayOccurrenceView margin](self->_draggingView, "margin");
    v27 = v27 + v72;
  }
LABEL_43:
  objc_msgSend(v18, "convertPoint:toView:", v16, v25, v27);
  v74 = v73;
  v76 = v75;

  v77 = v74;
  v78 = v76;
  result.y = v78;
  result.x = v77;
  return result;
}

- (double)_cancelRegionMargin
{
  id WeakRetained;
  _BOOL4 IsRegularInViewHierarchy;
  double result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(WeakRetained);

  result = 5.0;
  if (IsRegularInViewHierarchy)
    return 4.0;
  return result;
}

- (BOOL)_isPointInCancelRegion:(CGPoint)a3
{
  double y;
  EKEventGestureController *v4;
  id WeakRetained;
  void *v6;
  double v7;
  double v8;
  double v9;

  y = a3.y;
  v4 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "touchTrackingViewForEventGestureController:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "frame");
  v8 = v7;
  -[EKEventGestureController _cancelRegionMargin](v4, "_cancelRegionMargin");
  LOBYTE(v4) = y > v9 + v8;

  return (char)v4;
}

- (double)_Debug_HoursSinceStartOfDay:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v4 = (void *)MEMORY[0x1E0D0C420];
  -[EKEvent eventStore](self->_event, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarDateWithAbsoluteTime:timeZone:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendarDateForDay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteTime");
  v10 = (a3 - v9) / 3600.0;

  return v10;
}

- (int)currentDragSnappingType
{
  return self->_snappingTypeForCurrentDrag;
}

- (void)_updateSnappingTypeForCurrentDrag
{
  void *v3;
  double v4;
  double v5;
  int v6;

  self->_snappingTypeForCurrentDrag = 0;
  objc_msgSend(MEMORY[0x1E0D0C2F8], "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultEventDuration");
  v5 = v4;

  if (fabs(v5 + -3300.0) >= 2.22044605e-16 && fabs(v5 + -3000.0) >= 2.22044605e-16)
  {
    if (fabs(v5 + -1500.0) >= 2.22044605e-16)
      return;
    v6 = 2;
  }
  else
  {
    v6 = 1;
  }
  if (self->_currentDragType == 2)
    v6 = 3;
  self->_snappingTypeForCurrentDrag = v6;
}

- (EKEventGestureControllerUntimedDelegate)untimedDelegate
{
  return (EKEventGestureControllerUntimedDelegate *)objc_loadWeakRetained((id *)&self->_untimedDelegate);
}

- (void)setUntimedDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_untimedDelegate, a3);
}

- (EKEventGestureControllerDelegate)delegate
{
  return (EKEventGestureControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)usesXDragOffsetInCancelRegion
{
  return self->_usesXDragOffsetInCancelRegion;
}

- (void)setUsesXDragOffsetInCancelRegion:(BOOL)a3
{
  self->_usesXDragOffsetInCancelRegion = a3;
}

- (BOOL)usesHorizontalDragLocking
{
  return self->_usesHorizontalDragLocking;
}

- (BOOL)commitBlocked
{
  return self->_commitBlocked;
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (int64_t)occurrenceDateIndex
{
  return self->_occurrenceDateIndex;
}

- (CGPoint)firstTouchPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_firstTouchPoint.x;
  y = self->_firstTouchPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)latestTouchPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_latestTouchPoint.x;
  y = self->_latestTouchPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)touchOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_touchOffset.x;
  y = self->_touchOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSString)sessionIdentifierForDebug
{
  return self->_sessionIdentifierForDebug;
}

- (void)setSessionIdentifierForDebug:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifierForDebug, a3);
}

- (EKDayOccurrenceView)draggingViewSource
{
  return self->_draggingViewSource;
}

- (void)setDraggingViewSource:(id)a3
{
  objc_storeStrong((id *)&self->_draggingViewSource, a3);
}

- (EKUIEmailCompositionManager)messageSendingManager
{
  return self->_messageSendingManager;
}

- (void)setMessageSendingManager:(id)a3
{
  objc_storeStrong((id *)&self->_messageSendingManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSendingManager, 0);
  objc_storeStrong((id *)&self->_draggingViewSource, 0);
  objc_storeStrong((id *)&self->_sessionIdentifierForDebug, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_untimedDelegate);
  objc_storeStrong((id *)&self->_multiSelectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_currentICSPreviewController, 0);
  objc_storeStrong((id *)&self->_dragSnappingFeedback, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_scrollTimer, 0);
  objc_storeStrong((id *)&self->_currentDay, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_draggingView, 0);
  objc_destroyWeak((id *)&self->_targetView);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_draggingGestureRecognizer, 0);
}

@end
