@implementation BSPortDeathWatcher

- (BSPortDeathWatcher)initWithSendRight:(id)a3 queue:(id)a4 deathHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  BSPortDeathWatcher *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[BSPortDeathSentinel initWithSendRight:](self, "initWithSendRight:", v8);
  -[BSPortDeathSentinel setQueue:](v11, "setQueue:", v9);
  -[BSPortDeathSentinel activateWithHandler:](v11, "activateWithHandler:", v10);

  return v11;
}

- (BSPortDeathWatcher)initWithPort:(unsigned int)a3 queue:(id)a4 deathHandler:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  BSMachPortSendRight *v10;
  BSPortDeathWatcher *v11;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v10 = -[BSMachPortSendRight initWithPort:]([BSMachPortSendRight alloc], "initWithPort:", v6);
  v11 = -[BSPortDeathWatcher initWithSendRight:queue:deathHandler:](self, "initWithSendRight:queue:deathHandler:", v10, v8, v9);

  return v11;
}

@end
