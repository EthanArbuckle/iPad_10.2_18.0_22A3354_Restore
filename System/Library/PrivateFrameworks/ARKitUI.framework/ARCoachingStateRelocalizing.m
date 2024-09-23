@implementation ARCoachingStateRelocalizing

- (ARCoachingStateRelocalizing)initWithView:(id)a3
{
  ARCoachingStateRelocalizing *v3;
  ARCoachingHeuristicCollection *v4;
  ARCoachingHeuristicCollection *heuristics;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARCoachingStateRelocalizing;
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
  return 16;
}

- (void)enter
{
  void *v3;
  void *v4;
  void *v5;
  ARCoachingHeuristicCollection *heuristics;
  ARCoachingHeuristicDelay *v7;

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
  v7 = -[ARCoachingHeuristicDelay initWithDuration:]([ARCoachingHeuristicDelay alloc], "initWithDuration:", 1.0);
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
  __objc2_class *v19;
  ARCoachingState *v20;
  id v21;
  void *v22;
  ARCoachingState *v23;
  ARCoachingState *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  ARCoachingState *v29;
  ARCoachingState *v30;

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
      goto LABEL_15;
    case 2:
      v7 = ARCoachingStateDeactivating;
      goto LABEL_15;
    case 3:
      -[ARCoachingState view](self, "view");
      v8 = (ARCoachingFrame *)objc_claimAutoreleasedReturnValue();
      if ((-[ARCoachingFrame isUIAnimating](v8, "isUIAnimating") & 1) != 0)
        goto LABEL_20;
      nextState = self->_nextState;

      if (!nextState)
        goto LABEL_21;
      v10 = self->_nextState;
LABEL_13:
      v6 = v10;
      return v6;
    case 4:
      if (self->_nextState)
        goto LABEL_21;
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

      -[ARCoachingState view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v16) = objc_msgSend(v18, "checkDeactivationHeuristics");

      if ((_DWORD)v16)
      {
        v19 = ARCoachingStateDeactivating;
LABEL_19:
        v27 = [v19 alloc];
        -[ARCoachingState view](self, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (ARCoachingState *)objc_msgSend(v27, "initWithView:", v28);
        v30 = self->_nextState;
        self->_nextState = v29;

        goto LABEL_20;
      }
      if (-[ARCoachingHeuristic satisfied](self->_heuristics, "satisfied"))
      {
        -[ARCoachingState view](self, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isRelocalizing");

        if ((v26 & 1) == 0)
        {
          v19 = ARCoachingStateActivated;
          goto LABEL_19;
        }
      }
LABEL_20:

LABEL_21:
      v6 = 0;
      return v6;
    case 5:
      v20 = self->_nextState;
      self->_nextState = 0;

      goto LABEL_21;
    case 6:
      v10 = self->_nextState;
      if (v10)
        goto LABEL_13;
      goto LABEL_21;
    case 7:
      v7 = ARCoachingStateSessionFailed;
LABEL_15:
      v21 = [v7 alloc];
      -[ARCoachingState view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (ARCoachingState *)objc_msgSend(v21, "initWithView:", v22);
      v24 = self->_nextState;
      self->_nextState = v23;

      goto LABEL_21;
    default:
      goto LABEL_21;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heuristics, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

@end
