@implementation QLPXNumberFilter

- (QLPXNumberFilter)init
{
  return -[QLPXNumberFilter initWithInput:](self, "initWithInput:", 0.0);
}

- (QLPXNumberFilter)initWithInput:(double)a3
{
  QLPXNumberFilter *v4;
  QLPXNumberFilter *v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)QLPXNumberFilter;
  v4 = -[QLPXObservable init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_input = a3;
    -[QLPXNumberFilter initialOutputForInput:](v4, "initialOutputForInput:", a3);
    v5->_output = v6;
  }
  return v5;
}

- (double)updatedOutput
{
  return 0.0;
}

- (void)_setOutput:(double)a3
{
  if (self->_output != a3)
  {
    self->_output = a3;
    -[QLPXObservable signalChange:](self, "signalChange:", 2);
  }
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QLPXNumberFilter;
  -[QLPXObservable performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QLPXNumberFilter;
  -[QLPXObservable didPerformChanges](&v3, sel_didPerformChanges);
  -[QLPXNumberFilter _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_setLastTime:(double)a3
{
  self->_lastTime = a3;
}

- (void)setInput:(double)a3
{
  if (self->_input != a3)
  {
    self->_input = a3;
    -[QLPXObservable signalChange:](self, "signalChange:", 1);
    -[QLPXNumberFilter _invalidateOutput](self, "_invalidateOutput");
  }
}

- (void)setTime:(double)a3
{
  if (self->_time != a3)
  {
    self->_time = a3;
    -[QLPXNumberFilter _invalidateOutput](self, "_invalidateOutput");
  }
}

- (double)currentTime
{
  double result;

  -[QLPXNumberFilter time](self, "time");
  if (result == 0.0)
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  return result;
}

- (void)invalidateOutput
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __36__QLPXNumberFilter_invalidateOutput__block_invoke;
  v2[3] = &unk_24C725A90;
  v2[4] = self;
  -[QLPXNumberFilter performChanges:](self, "performChanges:", v2);
}

uint64_t __36__QLPXNumberFilter_invalidateOutput__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateOutput");
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.output;
}

- (void)_setNeedsUpdate
{
  -[QLPXObservable signalChange:](self, "signalChange:", 0);
}

- (void)_updateIfNeeded
{
  if (-[QLPXNumberFilter _needsUpdate](self, "_needsUpdate"))
    -[QLPXNumberFilter _updateOutputIfNeeded](self, "_updateOutputIfNeeded");
}

- (void)_invalidateOutput
{
  self->_needsUpdateFlags.output = 1;
  -[QLPXNumberFilter _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateOutputIfNeeded
{
  double v3;
  double v4;

  if (self->_needsUpdateFlags.output)
  {
    self->_needsUpdateFlags.output = 0;
    -[QLPXNumberFilter currentTime](self, "currentTime");
    v4 = v3;
    -[QLPXNumberFilter updatedOutput](self, "updatedOutput");
    -[QLPXNumberFilter _setOutput:](self, "_setOutput:");
    -[QLPXNumberFilter _setLastTime:](self, "_setLastTime:", v4);
  }
}

- (double)input
{
  return self->_input;
}

- (double)time
{
  return self->_time;
}

- (double)output
{
  return self->_output;
}

- (double)lastTime
{
  return self->_lastTime;
}

@end
