@implementation ARCoachingStateSessionFailed

- (ARCoachingStateSessionFailed)initWithView:(id)a3
{
  ARCoachingStateSessionFailed *v3;
  ARCoachingHeuristicCollection *v4;
  ARCoachingHeuristicCollection *heuristics;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARCoachingStateSessionFailed;
  v3 = -[ARCoachingState initWithView:](&v7, sel_initWithView_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(ARCoachingHeuristicCollection);
    heuristics = v3->_heuristics;
    v3->_heuristics = v4;

  }
  return v3;
}

- (int64_t)requirements
{
  return 64;
}

- (void)enter
{
  void *v3;
  void *v4;
  void *v5;
  ARCoachingHeuristicCollection *heuristics;
  ARCoachingHeuristicHasActiveFrames *v7;

  -[ARCoachingState view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startup");

  -[ARCoachingState view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fadeInWithButton:", 1);

  -[ARCoachingState view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  -[ARCoachingHeuristicCollection clear](self->_heuristics, "clear");
  heuristics = self->_heuristics;
  v7 = objc_alloc_init(ARCoachingHeuristicHasActiveFrames);
  -[ARCoachingHeuristicCollection addHeuristic:](heuristics, "addHeuristic:", v7);

}

- (id)doAction:(int64_t)a3
{
  ARCoachingStateHidden *v4;
  void *v5;
  ARCoachingStateHidden *v6;
  __objc2_class *v7;
  ARCoachingFrame *v8;
  ARCoachingState *nextState;
  ARCoachingState *v10;
  ARCoachingFrame *v11;
  void *v12;
  void *v13;
  void *v14;
  ARCoachingHeuristicCollection *heuristics;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  __objc2_class *v20;
  id v21;
  void *v22;
  ARCoachingState *v23;
  ARCoachingState *v24;
  ARCoachingState *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  ARCoachingState *v30;
  ARCoachingState *v31;

  switch(a3)
  {
    case 0:
      v4 = [ARCoachingStateHidden alloc];
      -[ARCoachingState view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[ARCoachingState initWithView:](v4, "initWithView:", v5);

      return v6;
    case 1:
      v7 = ARCoachingStateActivated;
      goto LABEL_13;
    case 2:
      v7 = ARCoachingStateDeactivating;
      goto LABEL_13;
    case 3:
      -[ARCoachingState view](self, "view");
      v8 = (ARCoachingFrame *)objc_claimAutoreleasedReturnValue();
      if ((-[ARCoachingFrame isUIAnimating](v8, "isUIAnimating") & 1) != 0)
        goto LABEL_21;
      nextState = self->_nextState;

      if (!nextState)
        goto LABEL_22;
      v10 = self->_nextState;
LABEL_15:
      v6 = v10;
      break;
    case 4:
      if (self->_nextState)
        goto LABEL_22;
      v11 = [ARCoachingFrame alloc];
      -[ARCoachingState view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "session");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentFrame");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[ARCoachingFrame initWithFrame:](v11, "initWithFrame:", v14);

      heuristics = self->_heuristics;
      -[ARCoachingState view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "coachingSessionCache");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARCoachingHeuristicCollection updateWithFrame:cache:](heuristics, "updateWithFrame:cache:", v8, v17);

      if (-[ARCoachingHeuristic satisfied](self->_heuristics, "satisfied"))
      {
        -[ARCoachingState view](self, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "activatesAutomatically");

        if (v19)
        {
          v20 = ARCoachingStateDeactivating;
        }
        else
        {
          -[ARCoachingState view](self, "view");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isRelocalizing");

          if (v27)
            v20 = ARCoachingStateRelocalizing;
          else
            v20 = ARCoachingStateActivated;
        }
        v28 = [v20 alloc];
        -[ARCoachingState view](self, "view");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (ARCoachingState *)objc_msgSend(v28, "initWithView:", v29);
        v31 = self->_nextState;
        self->_nextState = v30;

      }
LABEL_21:

      goto LABEL_22;
    case 5:
      v7 = ARCoachingStateRelocalizing;
LABEL_13:
      v21 = [v7 alloc];
      -[ARCoachingState view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (ARCoachingState *)objc_msgSend(v21, "initWithView:", v22);
      v24 = self->_nextState;
      self->_nextState = v23;

      goto LABEL_22;
    case 6:
      v10 = self->_nextState;
      if (v10)
        goto LABEL_15;
      goto LABEL_22;
    case 7:
      v25 = self->_nextState;
      self->_nextState = 0;

      goto LABEL_22;
    default:
LABEL_22:
      v6 = 0;
      break;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heuristics, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

@end
