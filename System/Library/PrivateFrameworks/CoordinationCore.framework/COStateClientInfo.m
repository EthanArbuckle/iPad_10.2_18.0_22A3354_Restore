@implementation COStateClientInfo

- (COStateClientInfo)initWithSuite:(id)a3 clusters:(id)a4
{
  id v7;
  id v8;
  COStateClientInfo *v9;
  COStateClientInfo *v10;
  NSDictionary *v11;
  NSDictionary *observers;
  NSDictionary *v13;
  NSDictionary *state;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)COStateClientInfo;
  v9 = -[COStateClientInfo init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clusters, a4);
    objc_storeStrong((id *)&v10->_suite, a3);
    v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    observers = v10->_observers;
    v10->_observers = v11;

    v13 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    state = v10->_state;
    v10->_state = v13;

  }
  return v10;
}

- (id)stateForCluster:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_state, "objectForKeyedSubscript:", a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  COMutableStateClientInfo *v4;

  v4 = -[COStateClientInfo initWithSuite:clusters:]([COMutableStateClientInfo alloc], "initWithSuite:clusters:", self->_suite, self->_clusters);
  -[COMutableStateClientInfo setObservers:](v4, "setObservers:", self->_observers);
  -[COMutableStateClientInfo setState:](v4, "setState:", self->_state);
  -[COStateClientInfo setOutstandingWriteCount:](v4, "setOutstandingWriteCount:", self->_outstandingWriteCount);
  -[COStateClientInfo setDisconnected:](v4, "setDisconnected:", self->_disconnected);
  return v4;
}

- (NSDictionary)observers
{
  return self->_observers;
}

- (NSDictionary)state
{
  return self->_state;
}

- (NSString)suite
{
  return self->_suite;
}

- (NSSet)clusters
{
  return self->_clusters;
}

- (int64_t)outstandingWriteCount
{
  return self->_outstandingWriteCount;
}

- (void)setOutstandingWriteCount:(int64_t)a3
{
  self->_outstandingWriteCount = a3;
}

- (BOOL)disconnected
{
  return self->_disconnected;
}

- (void)setDisconnected:(BOOL)a3
{
  self->_disconnected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusters, 0);
  objc_storeStrong((id *)&self->_suite, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
