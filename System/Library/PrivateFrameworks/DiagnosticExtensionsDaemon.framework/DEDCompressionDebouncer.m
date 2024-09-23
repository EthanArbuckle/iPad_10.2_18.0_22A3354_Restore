@implementation DEDCompressionDebouncer

- (DEDCompressionDebouncer)initWithTrigger:(id)a3 interval:(double)a4
{
  id v6;
  DEDCompressionDebouncer *v7;
  DEDCompressionDebouncer *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DEDCompressionDebouncer;
  v7 = -[DEDCompressionDebouncer init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[DEDCompressionDebouncer setTrigger:](v7, "setTrigger:", v6);
    -[DEDCompressionDebouncer setInterval:](v8, "setInterval:", a4);
    -[DEDCompressionDebouncer setLastTriggerTime:](v8, "setLastTriggerTime:", 0.0);
    -[DEDCompressionDebouncer setFinished:](v8, "setFinished:", 0);
  }

  return v8;
}

- (void)sendTriggerIfStateChanged
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  -[DEDCompressionDebouncer setLastTriggerTime:](self, "setLastTriggerTime:");

  v4 = -[DEDCompressionDebouncer lastSentCompressedBytes](self, "lastSentCompressedBytes");
  if (v4 != -[DEDCompressionDebouncer lastKnownCompressedBytes](self, "lastKnownCompressedBytes")
    || (v5 = -[DEDCompressionDebouncer lastSentTotalBytes](self, "lastSentTotalBytes"),
        v5 != -[DEDCompressionDebouncer lastKnownTotalBytes](self, "lastKnownTotalBytes")))
  {
    -[DEDCompressionDebouncer trigger](self, "trigger");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, -[DEDCompressionDebouncer lastKnownCompressedBytes](self, "lastKnownCompressedBytes"), -[DEDCompressionDebouncer lastKnownTotalBytes](self, "lastKnownTotalBytes"));

    -[DEDCompressionDebouncer setLastSentCompressedBytes:](self, "setLastSentCompressedBytes:", -[DEDCompressionDebouncer lastKnownCompressedBytes](self, "lastKnownCompressedBytes"));
    -[DEDCompressionDebouncer setLastSentTotalBytes:](self, "setLastSentTotalBytes:", -[DEDCompressionDebouncer lastKnownTotalBytes](self, "lastKnownTotalBytes"));
  }
}

- (void)sendTriggerIfTimeElapsed
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  id v10;

  v3 = -[DEDCompressionDebouncer lastKnownCompressedBytes](self, "lastKnownCompressedBytes");
  if (v3 >= -[DEDCompressionDebouncer lastKnownTotalBytes](self, "lastKnownTotalBytes"))
  {
    -[DEDCompressionDebouncer lastKnownTotalBytes](self, "lastKnownTotalBytes");
    if (!-[DEDCompressionDebouncer finished](self, "finished"))
    {
      -[DEDCompressionDebouncer setFinished:](self, "setFinished:", 1);
LABEL_8:
      -[DEDCompressionDebouncer sendTriggerIfStateChanged](self, "sendTriggerIfStateChanged");
      return;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  v5 = v4;
  -[DEDCompressionDebouncer lastTriggerTime](self, "lastTriggerTime");
  v7 = v5 - v6;
  -[DEDCompressionDebouncer interval](self, "interval");
  if (v7 < v8)
  {

    return;
  }
  v9 = -[DEDCompressionDebouncer finished](self, "finished");

  if (!v9)
    goto LABEL_8;
}

- (id)handler
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __34__DEDCompressionDebouncer_handler__block_invoke;
  v3[3] = &unk_24D1E5440;
  v3[4] = self;
  return (id)MEMORY[0x2199D4184](v3, a2);
}

uint64_t __34__DEDCompressionDebouncer_handler__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "setLastKnownCompressedBytes:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setLastKnownTotalBytes:", a3);
  return objc_msgSend(*(id *)(a1 + 32), "sendTriggerIfTimeElapsed");
}

- (id)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (unint64_t)lastSentTotalBytes
{
  return self->_lastSentTotalBytes;
}

- (void)setLastSentTotalBytes:(unint64_t)a3
{
  self->_lastSentTotalBytes = a3;
}

- (unint64_t)lastSentCompressedBytes
{
  return self->_lastSentCompressedBytes;
}

- (void)setLastSentCompressedBytes:(unint64_t)a3
{
  self->_lastSentCompressedBytes = a3;
}

- (unint64_t)lastKnownTotalBytes
{
  return self->_lastKnownTotalBytes;
}

- (void)setLastKnownTotalBytes:(unint64_t)a3
{
  self->_lastKnownTotalBytes = a3;
}

- (unint64_t)lastKnownCompressedBytes
{
  return self->_lastKnownCompressedBytes;
}

- (void)setLastKnownCompressedBytes:(unint64_t)a3
{
  self->_lastKnownCompressedBytes = a3;
}

- (double)lastTriggerTime
{
  return self->_lastTriggerTime;
}

- (void)setLastTriggerTime:(double)a3
{
  self->_lastTriggerTime = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_trigger, 0);
}

@end
