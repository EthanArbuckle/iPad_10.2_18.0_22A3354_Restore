@implementation MAParallelProgressReporter

- (MAParallelProgressReporter)initWithParallelProgress:(id)a3 index:(unint64_t)a4
{
  id v7;
  id *v8;
  MAParallelProgressReporter *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MAParallelProgressReporter;
  v8 = -[MAProgressReporter initForSubclasses](&v11, sel_initForSubclasses);
  v9 = (MAParallelProgressReporter *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 1, a3);
    v9->_index = a4;
  }

  return v9;
}

- (BOOL)isCancelled
{
  return -[MAParallelProgress isCancelled](self->_parallelProgress, "isCancelled");
}

- (BOOL)isCancelledWithProgress:(double)a3
{
  return -[MAParallelProgress isCancelledWithProgress:index:](self->_parallelProgress, "isCancelledWithProgress:index:", self->_index, a3);
}

- (id)childProgressWithOffset:(double)a3 scale:(double)a4
{
  return -[MAChildProgressReporter initWithParentProgress:offset:scale:]([MAChildProgressReporter alloc], "initWithParentProgress:offset:scale:", self, a3, a4);
}

- (MAParallelProgress)parallelProgress
{
  return self->_parallelProgress;
}

- (unint64_t)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parallelProgress, 0);
}

@end
