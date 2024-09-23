@implementation COMessagingClientInfo

- (COMessagingClientInfo)initWithTopic:(id)a3 cluster:(id)a4 handledClasses:(id)a5 client:(id)a6 activateCompletionHanlder:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  COMessagingClientInfo *v18;
  COMessagingClientInfo *v19;
  uint64_t v20;
  id completionHandler;
  uint64_t v22;
  NSMutableDictionary *sessions;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)COMessagingClientInfo;
  v18 = -[COMessagingClientInfo init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_topic, a3);
    objc_storeStrong(&v19->_cluster, a4);
    objc_storeStrong((id *)&v19->_handledClasses, a5);
    v20 = MEMORY[0x2199F3D40](v17);
    completionHandler = v19->_completionHandler;
    v19->_completionHandler = (id)v20;

    objc_storeWeak((id *)&v19->_client, v16);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    sessions = v19->_sessions;
    v19->_sessions = (NSMutableDictionary *)v22;

  }
  return v19;
}

- (NSString)topic
{
  return self->_topic;
}

- (id)cluster
{
  return self->_cluster;
}

- (NSSet)handledClasses
{
  return self->_handledClasses;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (COCoordinationServiceClient)client
{
  return (COCoordinationServiceClient *)objc_loadWeakRetained((id *)&self->_client);
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_handledClasses, 0);
  objc_storeStrong(&self->_cluster, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
