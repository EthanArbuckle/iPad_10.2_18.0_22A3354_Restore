@implementation AXUIMessageContext

- (OS_xpc_object)xpcMessage
{
  return self->_xpcMessage;
}

- (void)setXpcMessage:(id)a3
{
  objc_storeStrong((id *)&self->_xpcMessage, a3);
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (AXAccessQueue)targetAccessQueue
{
  return self->_targetAccessQueue;
}

- (void)setTargetAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_targetAccessQueue, a3);
}

- (BOOL)completionRequiresWritingBlock
{
  return self->_completionRequiresWritingBlock;
}

- (void)setCompletionRequiresWritingBlock:(BOOL)a3
{
  self->_completionRequiresWritingBlock = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_targetAccessQueue, 0);
  objc_storeStrong((id *)&self->_xpcMessage, 0);
}

@end
