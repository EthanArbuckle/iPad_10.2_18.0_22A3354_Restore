@implementation AVHapticSequenceEntry

- (AVHapticSequenceEntry)initWithHandler:(id)a3
{
  id v4;
  AVHapticSequenceEntry *v5;
  uint64_t v6;
  id handler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVHapticSequenceEntry;
  v5 = -[AVHapticSequenceEntry init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1B5E4F2B4](v4);
    handler = v5->_handler;
    v5->_handler = (id)v6;

  }
  return v5;
}

- (id)handler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)detached
{
  return self->_detached;
}

- (void)setDetached:(BOOL)a3
{
  self->_detached = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
