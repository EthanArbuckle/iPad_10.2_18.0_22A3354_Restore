@implementation ARCoachingStateActivated

- (void)enter
{
  void *v3;
  void *v4;
  id v5;

  -[ARCoachingState view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startup");

  -[ARCoachingState view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fadeInWithButton:", 0);

  -[ARCoachingState view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

}

- (id)doAction:(int64_t)a3
{
  ARCoachingStateHidden *v4;
  void *v5;
  ARCoachingStateHidden *v6;
  ARCoachingState *nextState;
  __objc2_class *v8;
  void *v9;
  void *v10;
  int v11;
  __objc2_class *v12;
  ARCoachingState *v13;
  id v14;
  void *v15;
  ARCoachingState *v16;
  ARCoachingState *v17;
  ARCoachingState *v19;
  void *v20;
  int v21;
  id v22;
  ARCoachingState *v23;
  ARCoachingState *v24;

  switch(a3)
  {
    case 0:
      v4 = [ARCoachingStateHidden alloc];
      -[ARCoachingState view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[ARCoachingState initWithView:](v4, "initWithView:", v5);

      return v6;
    case 1:
      nextState = self->_nextState;
      self->_nextState = 0;

      goto LABEL_16;
    case 2:
      v8 = ARCoachingStateDeactivating;
      goto LABEL_14;
    case 3:
      -[ARCoachingState view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isUIAnimating") & 1) != 0)
      {

        goto LABEL_16;
      }
      v19 = self->_nextState;

      if (!v19)
        goto LABEL_16;
      v13 = self->_nextState;
LABEL_20:
      v6 = v13;
      return v6;
    case 4:
      if (self->_nextState)
        goto LABEL_16;
      -[ARCoachingState view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "checkDeactivationHeuristics");

      if (v11)
      {
        v12 = ARCoachingStateDeactivating;
      }
      else
      {
        -[ARCoachingState view](self, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isRelocalizing");

        if (!v21)
          goto LABEL_16;
        v12 = ARCoachingStateRelocalizing;
      }
      v22 = [v12 alloc];
      -[ARCoachingState view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (ARCoachingState *)objc_msgSend(v22, "initWithView:", v15);
      v24 = self->_nextState;
      self->_nextState = v23;

LABEL_15:
LABEL_16:
      v6 = 0;
      return v6;
    case 5:
      v8 = ARCoachingStateRelocalizing;
      goto LABEL_14;
    case 6:
      v13 = self->_nextState;
      if (!v13)
        goto LABEL_16;
      goto LABEL_20;
    case 7:
      v8 = ARCoachingStateSessionFailed;
LABEL_14:
      v14 = [v8 alloc];
      -[ARCoachingState view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (ARCoachingState *)objc_msgSend(v14, "initWithView:", v15);
      v17 = self->_nextState;
      self->_nextState = v16;

      goto LABEL_15;
    default:
      goto LABEL_16;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextState, 0);
}

@end
