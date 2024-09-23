@implementation FigMetalExecutionStatus

- (FigMetalExecutionStatus)init
{
  FigMetalExecutionStatus *v2;
  uint64_t v3;
  NSMutableArray *failedCommandBuffers;
  FigMetalExecutionStatus *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigMetalExecutionStatus;
  v2 = -[FigMetalExecutionStatus init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    failedCommandBuffers = v2->_failedCommandBuffers;
    v2->_failedCommandBuffers = (NSMutableArray *)v3;

    if (!v2->_failedCommandBuffers)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
      v5 = 0;
      goto LABEL_5;
    }
    v2->_status = 4;
    v2->_completedCommandBuffersCount = 0;
  }
  v5 = v2;
LABEL_5:

  return v5;
}

- (NSMutableArray)failedCommandBuffers
{
  return self->_failedCommandBuffers;
}

- (void)setFailedCommandBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_failedCommandBuffers, a3);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (int)completedCommandBuffersCount
{
  return self->_completedCommandBuffersCount;
}

- (void)setCompletedCommandBuffersCount:(int)a3
{
  self->_completedCommandBuffersCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedCommandBuffers, 0);
}

@end
