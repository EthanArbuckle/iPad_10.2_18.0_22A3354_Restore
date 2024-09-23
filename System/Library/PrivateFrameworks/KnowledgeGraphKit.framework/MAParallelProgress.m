@implementation MAParallelProgress

- (MAParallelProgress)initWithProgressReporter:(id)a3 parallelOperationCount:(unint64_t)a4
{
  id v7;
  MAParallelProgress *v8;
  MAParallelProgress *v9;
  uint64_t v10;
  MAMutableFloatVector *progressValues;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MAParallelProgress;
  v8 = -[MAParallelProgress init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_progressReporter, a3);
    +[MAFloatVector zerosOfCount:](MAMutableFloatVector, "zerosOfCount:", a4);
    v10 = objc_claimAutoreleasedReturnValue();
    progressValues = v9->_progressValues;
    v9->_progressValues = (MAMutableFloatVector *)v10;

  }
  return v9;
}

- (BOOL)isCancelled
{
  MAParallelProgress *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[MAProgressReporter isCancelled](v2->_progressReporter, "isCancelled");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isCancelledWithProgress:(double)a3 index:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  unint64_t v8;
  double v9;
  float v10;
  unint64_t v11;
  NSObject *v12;
  BOOL v13;
  int v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = -[MAFloatVector count](self->_progressValues, "count");
  if (v8 <= a4)
  {
    v11 = v8;
    KGLoggingConnection();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v15 = 134218240;
      v16 = a4;
      v17 = 2048;
      v18 = v11;
      _os_log_fault_impl(&dword_1CA0A5000, v12, OS_LOG_TYPE_FAULT, "Parallel progress index(%lu) out of bounds(%lu)", (uint8_t *)&v15, 0x16u);
    }

  }
  else
  {
    *(float *)&v9 = a3;
    -[MAMutableFloatVector setFloat:atIndex:](self->_progressValues, "setFloat:atIndex:", a4, v9);
    -[MAFloatVector mean](self->_progressValues, "mean");
    a3 = v10;
  }
  v13 = -[MAProgressReporter isCancelledWithProgress:](self->_progressReporter, "isCancelledWithProgress:", a3);
  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressValues, 0);
  objc_storeStrong((id *)&self->_progressReporter, 0);
}

@end
