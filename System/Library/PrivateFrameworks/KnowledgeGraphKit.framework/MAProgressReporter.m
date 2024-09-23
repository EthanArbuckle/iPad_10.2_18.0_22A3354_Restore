@implementation MAProgressReporter

- (id)initForSubclasses
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MAProgressReporter;
  return -[MAProgressReporter init](&v3, sel_init);
}

- (BOOL)isCancelled
{
  id v2;

  KGAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)isCancelledWithProgress:(double)a3
{
  return -[MAProgressReporter isCancelledWithProgress:currentTime:](self, "isCancelledWithProgress:currentTime:", a3, CFAbsoluteTimeGetCurrent());
}

- (BOOL)isCancelledWithProgress:(double)a3 currentTime:(double)a4
{
  id v4;

  KGAbstractMethodException(self, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (BOOL)isCancelledWithUnitsCompleted:(unint64_t)a3 outOf:(unint64_t)a4
{
  return -[MAProgressReporter isCancelledWithProgress:](self, "isCancelledWithProgress:", (double)a3 / (double)a4);
}

- (id)childProgressWithOffset:(double)a3 scale:(double)a4
{
  id v4;

  KGAbstractMethodException(self, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)childProgressReporterFromStart:(double)a3 toEnd:(double)a4
{
  return -[MAProgressReporter childProgressWithOffset:scale:](self, "childProgressWithOffset:scale:", a3, a4 - a3);
}

- (id)childProgressReporterForStep:(unint64_t)a3 outOf:(unint64_t)a4
{
  return -[MAProgressReporter childProgressWithOffset:scale:](self, "childProgressWithOffset:scale:", (double)a3 / (double)a4, 1.0 / (double)a4);
}

- (id)progressReportersForParallelOperationsWithCount:(unint64_t)a3
{
  MAParallelProgress *v4;
  void *v5;
  uint64_t v6;
  MAParallelProgressReporter *v7;

  v4 = -[MAParallelProgress initWithProgressReporter:parallelOperationCount:]([MAParallelProgress alloc], "initWithProgressReporter:parallelOperationCount:", self, a3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
  if (a3)
  {
    v6 = 0;
    do
    {
      v7 = -[MAParallelProgressReporter initWithParallelProgress:index:]([MAParallelProgressReporter alloc], "initWithParallelProgress:index:", v4, v6);
      objc_msgSend(v5, "addObject:", v7);

      ++v6;
    }
    while (a3 != v6);
  }

  return v5;
}

+ (MAProgressReporter)ignoreProgress
{
  return (MAProgressReporter *)objc_alloc_init(MAIgnoreProgressReporter);
}

+ (MAProgressReporter)progressReporterWithProgressBlock:(id)a3
{
  id v3;
  MALegacyProgressReporter *v4;

  v3 = a3;
  v4 = -[MALegacyProgressReporter initWithProgressBlock:]([MALegacyProgressReporter alloc], "initWithProgressBlock:", v3);

  return (MAProgressReporter *)v4;
}

@end
