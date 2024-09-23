@implementation COMeshNodeStateTracker

- (COMeshNodeStateTracker)initWithNode:(id)a3
{
  id v5;
  COMeshNodeStateTracker *v6;
  COMeshNodeStateTracker *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMeshNodeStateTracker;
  v6 = -[COMeshNodeStateTracker init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_node, a3);

  return v7;
}

- (id)description
{
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[COMeshNodeStateTracker status](self, "status");
  if (v3 > 2)
    v4 = CFSTR("unknown");
  else
    v4 = off_24D4B33D8[v3];
  COMeshControllerStateDescription(-[COMeshNodeStateTracker state](self, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshNodeStateTracker node](self, "node");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p, state: %@, status: %@, node: %@>"), v8, self, v5, v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setBackoffTimer:(id)a3
{
  OS_dispatch_source *v5;
  NSObject *v6;
  OS_dispatch_source **p_backoffTimer;
  OS_dispatch_source *backoffTimer;
  OS_dispatch_source *v9;

  v5 = (OS_dispatch_source *)a3;
  backoffTimer = self->_backoffTimer;
  p_backoffTimer = &self->_backoffTimer;
  v6 = backoffTimer;
  v9 = v5;
  if (backoffTimer != v5)
  {
    if (v6)
      dispatch_source_cancel(v6);
    objc_storeStrong((id *)p_backoffTimer, a3);
    if (*p_backoffTimer)
      dispatch_resume((dispatch_object_t)*p_backoffTimer);
  }

}

- (void)resetBackoffInformation
{
  -[COMeshNodeStateTracker setBackoffResponse:](self, "setBackoffResponse:", 0);
  -[COMeshNodeStateTracker setLastBallotReceived:](self, "setLastBallotReceived:", 0);
  -[COMeshNodeStateTracker setLastBallotSent:](self, "setLastBallotSent:", 0);
  -[COMeshNodeStateTracker setOutstandingRequest:](self, "setOutstandingRequest:", 0);
}

- (void)setState:(unint64_t)a3
{
  unint64_t v3;
  unint64_t state;
  BOOL v6;
  uint64_t v7;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;

  v3 = a3;
  switch(a3)
  {
    case 0uLL:
    case 4uLL:
      -[COMeshNodeStateTracker setStatus:](self, "setStatus:", 0);
      -[COMeshNodeStateTracker resetBackoffInformation](self, "resetBackoffInformation");
      break;
    case 1uLL:
      if (-[COMeshNodeStateTracker status](self, "status") != 2)
        -[COMeshNodeStateTracker setStatus:](self, "setStatus:", 0);
      break;
    case 2uLL:
    case 3uLL:
      -[COMeshNodeStateTracker setStatus:](self, "setStatus:", 1);
      -[COMeshNodeStateTracker setOutstandingProbe:](self, "setOutstandingProbe:", 0);
      break;
    default:
      break;
  }
  state = self->_state;
  v6 = state > 4;
  v7 = (1 << state) & 0x13;
  if (v6 || v7 == 0)
  {
    self->_state = v3;
  }
  else
  {
    self->_state = v3;
    if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      -[COMeshNodeStateTracker delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        -[COMeshNodeStateTracker delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "nodeBecameAvailable:", self);

      }
      v3 = self->_state;
    }
  }
  if (v3 != 2)
  {
    -[COMeshNodeStateTracker setBackoffTimer:](self, "setBackoffTimer:", 0);
    if (self->_totalBackedOffTime)
    {
      -[COMeshNodeStateTracker delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        -[COMeshNodeStateTracker delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "backedOffNodeMovedOutOfElection:", self);

      }
    }
    self->_totalBackedOffTime = 0;
  }
}

- (void)setElectionStage:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  if (self->_electionStage != a3)
  {
    self->_electionStage = a3;
    if (a3 == 4)
    {
      -[COMeshNodeStateTracker backoffTimer](self, "backoffTimer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        -[COMeshNodeStateTracker node](self, "node");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "client");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dispatchQueue");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v7);

        if (v8)
        {
          v9 = dispatch_walltime(0, 100000000);
          dispatch_source_set_timer(v8, v9, 0x5F5E100uLL, 0);
          objc_initWeak(&location, self);
          v11 = MEMORY[0x24BDAC760];
          v12 = 3221225472;
          v13 = __43__COMeshNodeStateTracker_setElectionStage___block_invoke;
          v14 = &unk_24D4B0CD8;
          objc_copyWeak(&v15, &location);
          dispatch_source_set_event_handler(v8, &v11);
          -[COMeshNodeStateTracker setBackoffBucket:](self, "setBackoffBucket:", 0, v11, v12, v13, v14);
          -[COMeshNodeStateTracker setBackoffTimer:](self, "setBackoffTimer:", v8);
          objc_destroyWeak(&v15);
          objc_destroyWeak(&location);
        }
        else
        {
          COCoreLogForCategory(0);
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            -[COMeshNodeStateTracker setElectionStage:].cold.1(v10);

        }
      }
    }
  }
}

void __43__COMeshNodeStateTracker_setElectionStage___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "didFireBackoffTimer");
    WeakRetained = v2;
  }

}

- (void)setLastHeard:(double)a3
{
  double v5;

  -[COMeshNodeStateTracker lastHeard](self, "lastHeard");
  if (v5 != a3)
  {
    self->_lastHeard = a3;
    -[COMeshNodeStateTracker setOutstandingProbe:](self, "setOutstandingProbe:", 0);
  }
}

- (void)didFireBackoffTimer
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  dispatch_time_t v7;
  NSObject *v8;
  void *v9;
  id v10;

  v3 = -[COMeshNodeStateTracker backoffBucket](self, "backoffBucket");
  v4 = COMeshNodeStateTrackerBackoffSeries[v3];
  self->_totalBackedOffTime += v4;
  if (v3 <= 0xC)
  {
    v5 = v3 + 1;
    -[COMeshNodeStateTracker setBackoffBucket:](self, "setBackoffBucket:", v3 + 1);
    v4 = COMeshNodeStateTrackerBackoffSeries[v5];
  }
  v6 = 1000000 * v4;
  v7 = dispatch_walltime(0, 1000000 * v4);
  -[COMeshNodeStateTracker backoffTimer](self, "backoffTimer");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v8, v7, v6, 0);

  -[COMeshNodeStateTracker delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[COMeshNodeStateTracker delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nodeShouldRetryAfterBackoff:", self);

  }
}

- (COMeshNode)node
{
  return self->_node;
}

- (unint64_t)state
{
  return self->_state;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)electionStage
{
  return self->_electionStage;
}

- (COMeshNodeStateTrackerDelegate)delegate
{
  return (COMeshNodeStateTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)backoffBucket
{
  return self->_backoffBucket;
}

- (void)setBackoffBucket:(unint64_t)a3
{
  self->_backoffBucket = a3;
}

- (unint64_t)totalBackedOffTime
{
  return self->_totalBackedOffTime;
}

- (id)backoffResponse
{
  return self->_backoffResponse;
}

- (void)setBackoffResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)lastGenerationSent
{
  return self->_lastGenerationSent;
}

- (void)setLastGenerationSent:(unint64_t)a3
{
  self->_lastGenerationSent = a3;
}

- (COBallot)lastBallotSent
{
  return self->_lastBallotSent;
}

- (void)setLastBallotSent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unint64_t)lastGenerationReceived
{
  return self->_lastGenerationReceived;
}

- (void)setLastGenerationReceived:(unint64_t)a3
{
  self->_lastGenerationReceived = a3;
}

- (COBallot)lastBallotReceived
{
  return self->_lastBallotReceived;
}

- (void)setLastBallotReceived:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (double)lastHeard
{
  return self->_lastHeard;
}

- (BOOL)hasOutstandingProbe
{
  return self->_outstandingProbe;
}

- (void)setOutstandingProbe:(BOOL)a3
{
  self->_outstandingProbe = a3;
}

- (BOOL)hasOutstandingRequest
{
  return self->_outstandingRequest;
}

- (void)setOutstandingRequest:(BOOL)a3
{
  self->_outstandingRequest = a3;
}

- (OS_dispatch_source)backoffTimer
{
  return self->_backoffTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_lastBallotReceived, 0);
  objc_storeStrong((id *)&self->_lastBallotSent, 0);
  objc_storeStrong(&self->_backoffResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_node, 0);
}

- (void)setElectionStage:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215E92000, log, OS_LOG_TYPE_ERROR, "Failed to create the back off timer!", v1, 2u);
}

@end
