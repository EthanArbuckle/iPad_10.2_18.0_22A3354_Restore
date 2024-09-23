@implementation termAssertionObserver

- (void)assertionTargetProcessDidExit:(id)a3
{
  void *v4;
  NSObject *v5;

  -[termAssertionObserver completionSem](self, "completionSem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[termAssertionObserver completionSem](self, "completionSem");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v5);

  }
}

- (OS_dispatch_semaphore)completionSem
{
  return self->_completionSem;
}

- (void)setCompletionSem:(id)a3
{
  objc_storeStrong((id *)&self->_completionSem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionSem, 0);
}

@end
