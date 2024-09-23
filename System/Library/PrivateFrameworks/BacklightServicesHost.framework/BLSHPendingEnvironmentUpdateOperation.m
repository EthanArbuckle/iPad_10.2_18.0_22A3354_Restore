@implementation BLSHPendingEnvironmentUpdateOperation

- (BLSHPendingEnvironmentUpdateOperation)initWithEvents:(id)a3 withInitialSpecifier:(id)a4
{
  id v7;
  id v8;
  BLSHPendingEnvironmentUpdateOperation *v9;
  BLSHPendingEnvironmentUpdateOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLSHPendingEnvironmentUpdateOperation;
  v9 = -[BLSHPendingEnvironmentUpdateOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_events, a3);
    objc_storeStrong((id *)&v10->_initialSpecifier, a4);
  }

  return v10;
}

- (BLSHPendingEnvironmentUpdateOperation)initWithTriggerEvent:(id)a3 withInitialSpecifier:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  BLSHPendingEnvironmentUpdateOperation *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[BLSHPendingEnvironmentUpdateOperation initWithEvents:withInitialSpecifier:](self, "initWithEvents:withInitialSpecifier:", v9, v7, v12, v13);
  return v10;
}

- (int64_t)type
{
  return 3;
}

- (BLSBacklightChangeEvent)triggerEvent
{
  return (BLSBacklightChangeEvent *)-[NSArray firstObject](self->_events, "firstObject");
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingEnvironmentUpdateOperation isStarted](self, "isStarted"), CFSTR("started"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingEnvironmentUpdateOperation didUpdateInitialState](self, "didUpdateInitialState"), CFSTR("updatedInitialState"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingEnvironmentUpdateOperation isCompleted](self, "isCompleted"), CFSTR("completed"));
  NSStringFromBLSBacklightChangeEvents();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("events"));

  v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_initialSpecifier, CFSTR("initial"), 1);
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSArray)events
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)didUpdateInitialState
{
  return self->_updatedInitialState;
}

- (void)setUpdatedInitialState:(BOOL)a3
{
  self->_updatedInitialState = a3;
}

- (BLSHPresentationDateSpecifier)initialSpecifier
{
  return (BLSHPresentationDateSpecifier *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSpecifier, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
