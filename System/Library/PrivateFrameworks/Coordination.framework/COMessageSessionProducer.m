@implementation COMessageSessionProducer

- (COMessageSessionProducer)initWithChannel:(id)a3 subTopic:(id)a4 delegate:(id)a5 dispatchQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  COMessageSessionProducer *v14;
  COMessageSessionProducer *v15;
  uint64_t v16;
  NSMutableDictionary *sessions;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)COMessageSessionProducer;
  v14 = -[COMessageSessionProducer init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_messageChannel, v10);
    objc_storeStrong((id *)&v15->_subTopic, a4);
    objc_storeWeak((id *)&v15->_delegate, v12);
    objc_storeStrong((id *)&v15->_delegateQueue, a6);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    sessions = v15->_sessions;
    v15->_sessions = (NSMutableDictionary *)v16;

  }
  return v15;
}

- (void)startSessionWithMembers:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_messageChannel);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_messageChannel);
    objc_msgSend(v5, "startSessionWithProducer:members:", self, v6);

  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, subTopic = %@>"), v5, self, self->_subTopic);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)subTopic
{
  return self->_subTopic;
}

- (COMessageChannel)messageChannel
{
  return (COMessageChannel *)objc_loadWeakRetained((id *)&self->_messageChannel);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (COMessageSessionProducerDelegate)delegate
{
  return (COMessageSessionProducerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
  objc_storeStrong((id *)&self->_sessions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_messageChannel);
  objc_storeStrong((id *)&self->_subTopic, 0);
}

@end
