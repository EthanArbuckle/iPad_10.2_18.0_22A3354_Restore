@implementation ARCoachingStateDeactivating

- (BOOL)isViewActiveForState
{
  return 0;
}

- (void)enter
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ARCoachingStateHidden *v10;
  ARCoachingState *v11;
  ARCoachingState *nextState;
  id v13;

  -[ARCoachingState view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ARCoachingState view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARCoachingState view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "coachingOverlayViewWillDeactivate:", v8);

  }
  -[ARCoachingState view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fadeOut");

  v10 = [ARCoachingStateHidden alloc];
  -[ARCoachingState view](self, "view");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v11 = -[ARCoachingState initWithView:](v10, "initWithView:", v13);
  nextState = self->_nextState;
  self->_nextState = v11;

}

- (id)doAction:(int64_t)a3
{
  ARCoachingStateHidden *v3;
  ARCoachingStateHidden *v5;
  void *v6;
  __objc2_class *v7;
  void *v8;
  ARCoachingState *v9;
  id v10;
  void *v11;
  ARCoachingState *v12;
  ARCoachingState *v13;
  ARCoachingState *nextState;

  v3 = 0;
  switch(a3)
  {
    case 0:
      v5 = [ARCoachingStateHidden alloc];
      -[ARCoachingState view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[ARCoachingState initWithView:](v5, "initWithView:", v6);

      return v3;
    case 1:
      v7 = ARCoachingStateActivated;
      goto LABEL_11;
    case 2:
      v7 = ARCoachingStateHidden;
      goto LABEL_11;
    case 3:
      -[ARCoachingState view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isUIAnimating") & 1) != 0)
      {

LABEL_12:
        v3 = 0;
        return v3;
      }
      nextState = self->_nextState;

      if (!nextState)
        goto LABEL_12;
      v9 = self->_nextState;
LABEL_16:
      v3 = v9;
      return v3;
    case 5:
      v7 = ARCoachingStateRelocalizing;
      goto LABEL_11;
    case 6:
      v9 = self->_nextState;
      if (!v9)
        goto LABEL_12;
      goto LABEL_16;
    case 7:
      v7 = ARCoachingStateSessionFailed;
LABEL_11:
      v10 = [v7 alloc];
      -[ARCoachingState view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (ARCoachingState *)objc_msgSend(v10, "initWithView:", v11);
      v13 = self->_nextState;
      self->_nextState = v12;

      goto LABEL_12;
    default:
      return v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextState, 0);
}

@end
