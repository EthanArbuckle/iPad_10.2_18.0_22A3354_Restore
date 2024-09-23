@implementation MARootProgressReporter

- (MARootProgressReporter)initWithProgressBlock:(id)a3
{
  id v4;
  MARootProgressReporter *v5;
  void *v6;
  id progressBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MARootProgressReporter;
  v5 = -[MAProgressReporter initForSubclasses](&v9, sel_initForSubclasses);
  if (v5)
  {
    v6 = _Block_copy(v4);
    progressBlock = v5->_progressBlock;
    v5->_progressBlock = v6;

    v5->_progress = 0.0;
    v5->_isCancelled = 0;
    v5->_lastProgressCallTime = 0.0;
  }

  return v5;
}

- (MARootProgressReporter)init
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MARootProgressReporter;
  v2 = -[MAProgressReporter initForSubclasses](&v6, sel_initForSubclasses);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)v2[3];
    v2[3] = &__block_literal_global;

    v3[4] = 0;
    *((_BYTE *)v3 + 16) = 0;
    v3[1] = 0;
  }
  return (MARootProgressReporter *)v3;
}

- (void)cancelOperation
{
  -[MARootProgressReporter setIsCancelled:](self, "setIsCancelled:", 1);
}

- (BOOL)isCancelledWithProgress:(double)a3 currentTime:(double)a4
{
  BOOL v7;

  v7 = -[MARootProgressReporter isCancelled](self, "isCancelled");
  if (!v7)
  {
    self->_progress = a3;
    if (a3 == 1.0 || a4 - self->_lastProgressCallTime >= 0.01)
    {
      self->_lastProgressCallTime = a4;
      (*((void (**)(double))self->_progressBlock + 2))(a3);
    }
  }
  return v7;
}

- (id)childProgressWithOffset:(double)a3 scale:(double)a4
{
  return -[MAChildProgressReporter initWithParentProgress:offset:scale:]([MAChildProgressReporter alloc], "initWithParentProgress:offset:scale:", self, a3, a4);
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (double)progress
{
  return self->_progress;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressBlock, 0);
}

@end
