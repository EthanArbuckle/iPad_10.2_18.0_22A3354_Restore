@implementation EKEventCreationGestureController

- (EKEventCreationGestureController)initWithView:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  EKEventCreationGestureController *v8;
  EKEventCreationGestureController *v9;
  uint64_t v10;
  UILongPressGestureRecognizer *gestureRecognizer;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)EKEventCreationGestureController;
  v8 = -[EKEventCreationGestureController init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_gestureDelegate, v7);
    objc_storeWeak((id *)&v9->_targetView, v6);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v9, sel_handleGesture_);
    gestureRecognizer = v9->_gestureRecognizer;
    v9->_gestureRecognizer = (UILongPressGestureRecognizer *)v10;

    -[UILongPressGestureRecognizer setDelegate:](v9->_gestureRecognizer, "setDelegate:", v9);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v9->_gestureRecognizer, "setMinimumPressDuration:", 0.16);
    -[UILongPressGestureRecognizer setAllowableMovement:](v9->_gestureRecognizer, "setAllowableMovement:", 1000.0);
    v12 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILongPressGestureRecognizer setAllowedTouchTypes:](v9->_gestureRecognizer, "setAllowedTouchTypes:", v14);

    WeakRetained = objc_loadWeakRetained((id *)&v9->_targetView);
    objc_msgSend(WeakRetained, "addGestureRecognizer:", v9->_gestureRecognizer);

    v9->_state = 0;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[EKEventCreationGestureController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)EKEventCreationGestureController;
  -[EKEventCreationGestureController dealloc](&v3, sel_dealloc);
}

- (BOOL)currentlyCreatingEvent
{
  return self->_state != 0;
}

- (void)invalidate
{
  UIView **p_targetView;
  id WeakRetained;
  UILongPressGestureRecognizer *gestureRecognizer;

  p_targetView = &self->_targetView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  objc_msgSend(WeakRetained, "removeGestureRecognizer:", self->_gestureRecognizer);

  gestureRecognizer = self->_gestureRecognizer;
  self->_gestureRecognizer = 0;

  objc_storeWeak((id *)&self->_gestureDelegate, 0);
  objc_storeWeak((id *)p_targetView, 0);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  EKEventCreationGestureController *v3;
  EKEventCreationGestureControllerDelegate **p_gestureDelegate;
  id WeakRetained;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v3 = self;
  p_gestureDelegate = &self->_gestureDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_gestureDelegate);
  objc_msgSend(WeakRetained, "creationGestureControllerRequestedContainerView:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILongPressGestureRecognizer locationInView:](v3->_gestureRecognizer, "locationInView:", v6);
  v8 = v7;
  v10 = v9;
  v11 = objc_loadWeakRetained((id *)p_gestureDelegate);
  LOBYTE(v3) = objc_msgSend(v11, "creationGestureController:canActivateAtPoint:", v3, v8, v10);

  return (char)v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  EKEventCreationGestureController *v4;
  EKEventCreationGestureControllerDelegate **p_gestureDelegate;
  id v6;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v4 = self;
  p_gestureDelegate = &self->_gestureDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_gestureDelegate);
  objc_msgSend(WeakRetained, "creationGestureControllerRequestedContainerView:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  v13 = objc_loadWeakRetained((id *)p_gestureDelegate);
  LOBYTE(v4) = objc_msgSend(v13, "creationGestureController:canActivateAtPoint:", v4, v10, v12);

  return (char)v4;
}

- (void)handleGesture:(id)a3
{
  switch(objc_msgSend(a3, "state"))
  {
    case 1:
      -[EKEventCreationGestureController _gestureBegan](self, "_gestureBegan");
      break;
    case 2:
      -[EKEventCreationGestureController _gestureUpdated](self, "_gestureUpdated");
      break;
    case 3:
      -[EKEventCreationGestureController _gestureCompleted](self, "_gestureCompleted");
      break;
    case 4:
    case 5:
      -[EKEventCreationGestureController _gestureCanceled](self, "_gestureCanceled");
      break;
    default:
      return;
  }
}

- (id)_snapDateTo15MinuteInterval:(id)a3
{
  double v3;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", round(v3 / 900.0) * 900.0);
}

- (void)_adjustPreviewFrame
{
  EKEventCreationGestureControllerDelegate **p_gestureDelegate;
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double y;

  p_gestureDelegate = &self->_gestureDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_gestureDelegate);
  objc_msgSend(WeakRetained, "creationGestureController:requestedWidthForEventPreview:atPoint:", self, self->_eventPreview, self->_originPoint.x, self->_originPoint.y);
  v6 = v5;

  -[UILongPressGestureRecognizer locationInView:](self->_gestureRecognizer, "locationInView:", self->_containerView);
  v8 = v7;
  v9 = self->_originPoint.y - v7;
  if (v9 >= 0.0)
    v10 = self->_originPoint.y - v7;
  else
    v10 = -v9;
  v11 = objc_loadWeakRetained((id *)p_gestureDelegate);
  objc_msgSend(v11, "creationGestureController:requestedXCoordinateForEventPreviewAtPoint:", self, self->_originPoint.x, self->_originPoint.y);
  v13 = v12;

  if (self->_originPoint.y >= v8)
    y = v8;
  else
    y = self->_originPoint.y;
  -[EKDayOccurrenceView setFrame:](self->_eventPreview, "setFrame:", v13, y, v6, v10);
  -[EKDayOccurrenceView requestContentIfNeeded:completion:](self->_eventPreview, "requestContentIfNeeded:completion:", 16, 0);
}

- (void)_cleanUp
{
  EKEvent *newEvent;
  UIView *containerView;
  EKDayOccurrenceView *eventPreview;

  -[EKDayOccurrenceView removeFromSuperview](self->_eventPreview, "removeFromSuperview");
  newEvent = self->_newEvent;
  self->_newEvent = 0;

  containerView = self->_containerView;
  self->_containerView = 0;

  eventPreview = self->_eventPreview;
  self->_eventPreview = 0;

  self->_originPoint = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_state = 0;
}

- (void)_gestureBegan
{
  EKEventCreationGestureControllerDelegate **p_gestureDelegate;
  id WeakRetained;
  UIView *v5;
  UIView *containerView;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  id v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id v18;

  p_gestureDelegate = &self->_gestureDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_gestureDelegate);
  objc_msgSend(WeakRetained, "creationGestureControllerRequestedContainerView:", self);
  v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  containerView = self->_containerView;
  self->_containerView = v5;

  -[UILongPressGestureRecognizer locationInView:](self->_gestureRecognizer, "locationInView:", self->_containerView);
  v8 = v7;
  v10 = v9;
  v11 = objc_loadWeakRetained((id *)p_gestureDelegate);
  objc_msgSend(v11, "creationGestureController:dateForPoint:", self, v8, v10);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[EKEventCreationGestureController _snapDateTo15MinuteInterval:](self, "_snapDateTo15MinuteInterval:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_loadWeakRetained((id *)p_gestureDelegate);
  objc_msgSend(v13, "creationGestureController:requestsPointForDate:", self, v12);
  v15 = v14;
  v17 = v16;

  self->_originPoint.x = v15;
  self->_originPoint.y = v17;
  self->_state = 1;

}

- (void)_gestureChangedEnoughToCreateEvent
{
  EKEventCreationGestureControllerDelegate **p_gestureDelegate;
  id WeakRetained;
  EKEvent *v5;
  EKEvent *newEvent;
  id v7;
  EKDayOccurrenceView *v8;
  EKDayOccurrenceView *eventPreview;

  p_gestureDelegate = &self->_gestureDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_gestureDelegate);
  v5 = (EKEvent *)objc_msgSend(WeakRetained, "creationGestureControllerRequestsNewEvent:", self);
  newEvent = self->_newEvent;
  self->_newEvent = v5;

  v7 = objc_loadWeakRetained((id *)p_gestureDelegate);
  v8 = (EKDayOccurrenceView *)objc_msgSend(v7, "creationGestureController:requestedPreviewForEvent:", self, self->_newEvent);
  eventPreview = self->_eventPreview;
  self->_eventPreview = v8;

  -[EKEventCreationGestureController _adjustPreviewFrame](self, "_adjustPreviewFrame");
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_eventPreview);
  self->_state = 2;
}

- (void)_gestureUpdated
{
  int state;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;

  state = self->_state;
  if (state == 1)
  {
    -[UILongPressGestureRecognizer locationInView:](self->_gestureRecognizer, "locationInView:", self->_containerView);
    v5 = v4 - self->_originPoint.y;
    if (v5 < 0.0)
      v5 = -v5;
    if (v5 > 10.0)
      -[EKEventCreationGestureController _gestureChangedEnoughToCreateEvent](self, "_gestureChangedEnoughToCreateEvent");
    state = self->_state;
  }
  if (state == 2)
  {
    -[EKEventCreationGestureController _adjustPreviewFrame](self, "_adjustPreviewFrame");
    -[UILongPressGestureRecognizer locationInView:](self->_gestureRecognizer, "locationInView:", self->_containerView);
    v7 = v6;
    v9 = v8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_gestureDelegate);
    objc_msgSend(WeakRetained, "creationGestureController:dateForPoint:", self, v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKEventCreationGestureController _snapDateTo15MinuteInterval:](self, "_snapDateTo15MinuteInterval:", v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v12 = objc_loadWeakRetained((id *)&self->_gestureDelegate);
    objc_msgSend(v12, "creationGestureController:didResizeToDate:", self, v13);

  }
}

- (void)_gestureCompleted
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double MaxY;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  EKEvent *newEvent;
  void *v20;
  id WeakRetained;
  EKEvent *v22;
  CGRect v23;
  CGRect v24;

  v22 = self->_newEvent;
  if (self->_state != 2)
  {
    -[EKEventCreationGestureController _cleanUp](self, "_cleanUp");
LABEL_8:
    WeakRetained = objc_loadWeakRetained((id *)&self->_gestureDelegate);
    objc_msgSend(WeakRetained, "creationGestureControllerDidCancel:", self);
    goto LABEL_9;
  }
  -[EKDayOccurrenceView frame](self->_eventPreview, "frame");
  v4 = v3;
  v6 = v5;
  -[EKDayOccurrenceView frame](self->_eventPreview, "frame");
  v7 = CGRectGetMaxX(v23) + -1.0;
  -[EKDayOccurrenceView frame](self->_eventPreview, "frame");
  MaxY = CGRectGetMaxY(v24);
  v9 = objc_loadWeakRetained((id *)&self->_gestureDelegate);
  objc_msgSend(v9, "creationGestureController:dateForPoint:", self, v4, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_loadWeakRetained((id *)&self->_gestureDelegate);
  objc_msgSend(v11, "creationGestureController:dateForPoint:", self, v7, MaxY);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventCreationGestureController _snapDateTo15MinuteInterval:](self, "_snapDateTo15MinuteInterval:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventCreationGestureController _snapDateTo15MinuteInterval:](self, "_snapDateTo15MinuteInterval:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v16 = v15;
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v18 = v16 - v17;
  newEvent = self->_newEvent;
  if (v18 <= 15.0)
  {
    -[EKEvent eventStore](newEvent, "eventStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeEvent:span:error:", self->_newEvent, 0, 0);

  }
  else
  {
    -[EKEvent setStartDate:](newEvent, "setStartDate:", v13);
    -[EKEvent setEndDateUnadjustedForLegacyClients:](self->_newEvent, "setEndDateUnadjustedForLegacyClients:", v14);
  }

  -[EKEventCreationGestureController _cleanUp](self, "_cleanUp");
  if (v18 <= 15.0)
    goto LABEL_8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_gestureDelegate);
  objc_msgSend(WeakRetained, "creationGestureController:didCreateNewEvent:", self, v22);
LABEL_9:

}

- (void)_gestureCanceled
{
  id WeakRetained;

  -[EKEventCreationGestureController _cleanUp](self, "_cleanUp");
  WeakRetained = objc_loadWeakRetained((id *)&self->_gestureDelegate);
  objc_msgSend(WeakRetained, "creationGestureControllerDidCancel:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPreview, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_newEvent, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_targetView);
  objc_destroyWeak((id *)&self->_gestureDelegate);
}

@end
