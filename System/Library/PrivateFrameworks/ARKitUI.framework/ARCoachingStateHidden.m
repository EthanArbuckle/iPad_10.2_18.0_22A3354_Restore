@implementation ARCoachingStateHidden

- (BOOL)isViewActiveForState
{
  return 0;
}

- (void)enter
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  -[ARCoachingState view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wasEverActivated");

  -[ARCoachingState view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[ARCoachingState view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "teardown");

  if (v4)
  {
    -[ARCoachingState view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[ARCoachingState view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARCoachingState view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "coachingOverlayViewDidDeactivate:", v12);

    }
  }
  self->_autoActivateTime = -1.0;
  self->_minimumWaitComplete = 0;
}

- (void)exit
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  -[ARCoachingState view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ARCoachingState view](self, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARCoachingState view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coachingOverlayViewWillActivate:", v7);

  }
}

- (id)doAction:(int64_t)a3
{
  void *v3;
  __objc2_class *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double autoActivateTime;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  uint64_t v20;
  void *v21;

  v3 = 0;
  switch(a3)
  {
    case 1:
      goto LABEL_2;
    case 4:
      -[ARCoachingState view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "checkActivationHeuristics");

      if (!v7)
        goto LABEL_7;
      -[ARCoachingState view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "session");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentFrame");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timestamp");
      v12 = v11;

      autoActivateTime = self->_autoActivateTime;
      if (autoActivateTime < 0.0)
      {
        -[ARCoachingState view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        self->_autoActivateTime = v12 + ARCoachingMinimumActivationDelay(objc_msgSend(v14, "goal"));
LABEL_6:

LABEL_10:
        v3 = 0;
        return v3;
      }
      if (v12 < autoActivateTime)
        goto LABEL_10;
      if (!self->_minimumWaitComplete)
      {
        self->_minimumWaitComplete = 1;
        -[ARCoachingState view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v14, "goal");
        -[ARCoachingState view](self, "view");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        self->_autoActivateTime = v12 + ARCoachingAdditionalActivationDelay(v20, objc_msgSend(v21, "isRelocalizing"));

        goto LABEL_6;
      }
      -[ARCoachingState view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isRelocalizing");

      if (v16)
LABEL_13:
        v5 = ARCoachingStateRelocalizing;
      else
LABEL_2:
        v5 = ARCoachingStateActivated;
LABEL_14:
      v17 = [v5 alloc];
      -[ARCoachingState view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(v17, "initWithView:", v18);

      return v3;
    case 5:
      goto LABEL_13;
    case 7:
      v5 = ARCoachingStateSessionFailed;
      goto LABEL_14;
    case 8:
LABEL_7:
      v3 = 0;
      self->_autoActivateTime = -1.0;
      return v3;
    default:
      return v3;
  }
}

@end
