@implementation AXThreadTimerTask

- (void)setBlock:(id)a3
{
  void *v4;
  id block;

  v4 = (void *)objc_msgSend(a3, "copy");
  block = self->_block;
  self->_block = v4;

}

- (void)run
{
  if (!-[AXThreadTimerTask isCancelled](self, "isCancelled"))
  {
    -[AXThreadTimerTask setActive:](self, "setActive:", 1);
    (*((void (**)(void))self->_block + 2))();
    -[AXThreadTimerTask setActive:](self, "setActive:", 0);
  }
  -[AXThreadTimerTask setFinished:](self, "setFinished:", 1);
}

- (void)runAfterDelay:(float)a3
{
  -[AXThreadTimerTask performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", &sel_run, 0, a3);
}

- (id)block
{
  return self->_block;
}

- (BOOL)isCancelled
{
  return self->cancel;
}

- (void)setCancel:(BOOL)a3
{
  self->cancel = a3;
}

- (BOOL)isFinished
{
  return self->finished;
}

- (void)setFinished:(BOOL)a3
{
  self->finished = a3;
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
