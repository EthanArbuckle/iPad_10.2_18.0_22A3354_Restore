@implementation DCBGSTask

- (DCBGSTask)initWithTaskIdentifier:(id)a3 observerIdentifier:(id)a4
{
  id v6;
  id v7;
  DCBGSTask *v8;
  DCBGSTask *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DCBGSTask;
  v8 = -[DCBGSTask init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[DCBGSTask setTaskID:](v8, "setTaskID:", v6);
    -[DCBGSTask setObserverID:](v9, "setObserverID:", v7);
  }

  return v9;
}

- (NSString)taskID
{
  return self->_taskID;
}

- (void)setTaskID:(id)a3
{
  objc_storeStrong((id *)&self->_taskID, a3);
}

- (NSString)observerID
{
  return self->_observerID;
}

- (void)setObserverID:(id)a3
{
  objc_storeStrong((id *)&self->_observerID, a3);
}

- (NSNumber)refreshInterval
{
  return self->_refreshInterval;
}

- (void)setRefreshInterval:(id)a3
{
  objc_storeStrong((id *)&self->_refreshInterval, a3);
}

- (id)taskHandler
{
  return self->_taskHandler;
}

- (void)setTaskHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_taskHandler, 0);
  objc_storeStrong((id *)&self->_refreshInterval, 0);
  objc_storeStrong((id *)&self->_observerID, 0);
  objc_storeStrong((id *)&self->_taskID, 0);
}

@end
