@implementation XRRunLoopTicket

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (BOOL)stopWhenDone
{
  return self->_stopWhenDone;
}

- (void)setStopWhenDone:(BOOL)a3
{
  self->_stopWhenDone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
}

@end
