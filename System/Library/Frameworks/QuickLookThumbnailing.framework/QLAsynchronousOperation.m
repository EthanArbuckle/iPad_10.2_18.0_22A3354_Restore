@implementation QLAsynchronousOperation

- (void)setFinished:(BOOL)a3
{
  if (self->_finished != a3)
  {
    -[QLAsynchronousOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_finished = a3;
    -[QLAsynchronousOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
}

- (void)setExecuting:(BOOL)a3
{
  if (self->_executing != a3)
  {
    -[QLAsynchronousOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    self->_executing = a3;
    -[QLAsynchronousOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  }
}

- (void)start
{
  -[QLAsynchronousOperation setExecuting:](self, "setExecuting:", 1);
  -[QLAsynchronousOperation main](self, "main");
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)finish
{
  -[QLAsynchronousOperation setExecuting:](self, "setExecuting:", 0);
  -[QLAsynchronousOperation setFinished:](self, "setFinished:", 1);
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

@end
