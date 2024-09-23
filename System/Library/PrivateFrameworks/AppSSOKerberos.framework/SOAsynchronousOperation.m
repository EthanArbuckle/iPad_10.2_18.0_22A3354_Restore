@implementation SOAsynchronousOperation

- (SOAsynchronousOperation)init
{
  SOAsynchronousOperation *v2;
  SOAsynchronousOperation *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SOAsynchronousOperation;
  v2 = -[SOAsynchronousOperation init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SOAsynchronousOperation setState:](v2, "setState:", 0);
  return v3;
}

- (BOOL)isFinished
{
  return -[SOAsynchronousOperation state](self, "state") == 2;
}

- (BOOL)isReady
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SOAsynchronousOperation;
  v3 = -[SOAsynchronousOperation isReady](&v5, sel_isReady);
  if (v3)
    LOBYTE(v3) = -[SOAsynchronousOperation state](self, "state") == 0;
  return v3;
}

- (BOOL)isExecuting
{
  return -[SOAsynchronousOperation state](self, "state") == 1;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  if (-[SOAsynchronousOperation isCancelled](self, "isCancelled"))
  {
    -[SOAsynchronousOperation finish](self, "finish");
  }
  else
  {
    -[SOAsynchronousOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    -[SOAsynchronousOperation setState:](self, "setState:", 1);
    -[SOAsynchronousOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    -[SOAsynchronousOperation main](self, "main");
  }
}

- (void)finish
{
  -[SOAsynchronousOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[SOAsynchronousOperation setState:](self, "setState:", 2);
  -[SOAsynchronousOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

@end
