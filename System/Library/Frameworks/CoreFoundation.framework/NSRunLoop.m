@implementation NSRunLoop

- (id)_dperf
{
  return self->_dperf;
}

- (CFRunLoopRef)getCFRunLoop
{
  return (CFRunLoopRef)self->_rl;
}

- (id)_perft
{
  return self->_perft;
}

- (id)_initWithRl:(id)a3 dperf:(id)a4 perft:(id)a5 info:(id)a6 ports:(id)a7
{
  self->_rl = a3;
  self->_dperf = a4;
  self->_perft = a5;
  self->_info = a6;
  self->_ports = a7;
  return self;
}

- (id)_ports
{
  return self->_ports;
}

- (id)_info
{
  return self->_info;
}

- (void)_deallocHelper
{
  id dperf;
  id rl;
  id info;
  id perft;
  id ports;

  objc_sync_enter(self);
  rl = self->_rl;
  dperf = self->_dperf;
  perft = self->_perft;
  info = self->_info;
  ports = self->_ports;
  *(_OWORD *)&self->_rl = 0u;
  *(_OWORD *)&self->_perft = 0u;
  self->_ports = 0;

  objc_sync_exit(self);
}

- (NSRunLoopMode)currentMode
{
  return (NSRunLoopMode)objc_getProperty(self, a2, 48, 1);
}

@end
