@implementation ARDaemonReplayBlockDelegate

- (void)replayDidFailWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[ARDaemonReplayBlockDelegate replayFailedBlock](self, "replayFailedBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ARDaemonReplayBlockDelegate replayFailedBlock](self, "replayFailedBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (void)replayDidStartWithReplayTime:(double)a3
{
  void *v5;
  void (**v6)(double);

  -[ARDaemonReplayBlockDelegate replayStartedBlock](self, "replayStartedBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ARDaemonReplayBlockDelegate replayStartedBlock](self, "replayStartedBlock");
    v6 = (void (**)(double))objc_claimAutoreleasedReturnValue();
    v6[2](a3);

  }
}

- (void)replayDidUpdateResourceWithKey:(id)a3 atTime:(double)a4
{
  void *v6;
  void (**v7)(_QWORD, _QWORD, double);
  id v8;

  v8 = a3;
  -[ARDaemonReplayBlockDelegate replayUpdatedBlock](self, "replayUpdatedBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ARDaemonReplayBlockDelegate replayUpdatedBlock](self, "replayUpdatedBlock");
    v7 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, double))v7)[2](v7, v8, a4);

  }
}

- (void)replayDidStop
{
  void *v3;
  void (**v4)(void);

  -[ARDaemonReplayBlockDelegate replayStoppedBlock](self, "replayStoppedBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ARDaemonReplayBlockDelegate replayStoppedBlock](self, "replayStoppedBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (id)replayFailedBlock
{
  return self->_replayFailedBlock;
}

- (void)setReplayFailedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)replayStartedBlock
{
  return self->_replayStartedBlock;
}

- (void)setReplayStartedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)replayUpdatedBlock
{
  return self->_replayUpdatedBlock;
}

- (void)setReplayUpdatedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)replayStoppedBlock
{
  return self->_replayStoppedBlock;
}

- (void)setReplayStoppedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_replayStoppedBlock, 0);
  objc_storeStrong(&self->_replayUpdatedBlock, 0);
  objc_storeStrong(&self->_replayStartedBlock, 0);
  objc_storeStrong(&self->_replayFailedBlock, 0);
}

@end
