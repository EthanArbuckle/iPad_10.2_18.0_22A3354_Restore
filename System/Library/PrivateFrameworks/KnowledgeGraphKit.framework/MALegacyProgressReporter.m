@implementation MALegacyProgressReporter

- (MALegacyProgressReporter)initWithProgressBlock:(id)a3
{
  id v4;
  MALegacyProgressReporter *v5;
  void *v6;
  id progressBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MALegacyProgressReporter;
  v5 = -[MAProgressReporter initForSubclasses](&v9, sel_initForSubclasses);
  if (v5)
  {
    v6 = _Block_copy(v4);
    progressBlock = v5->_progressBlock;
    v5->_progressBlock = v6;

    v5->_isCancelled = 0;
    v5->_lastProgressCallTime = 0.0;
  }

  return v5;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (BOOL)isCancelledWithProgress:(double)a3 currentTime:(double)a4
{
  BOOL *p_isCancelled;

  p_isCancelled = &self->_isCancelled;
  if (self->_isCancelled)
    return 1;
  if (a3 != 1.0 && a4 - self->_lastProgressCallTime < 0.01)
    return 0;
  self->_lastProgressCallTime = a4;
  (*((void (**)(void))self->_progressBlock + 2))();
  return *p_isCancelled;
}

- (id)childProgressWithOffset:(double)a3 scale:(double)a4
{
  return -[MAChildProgressReporter initWithParentProgress:offset:scale:]([MAChildProgressReporter alloc], "initWithParentProgress:offset:scale:", self, a3, a4);
}

- (id)progressBlock
{
  return self->_progressBlock;
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
