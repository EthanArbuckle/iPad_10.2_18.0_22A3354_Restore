@implementation XRMobileAgentDock

- (XRMobileAgentDock)init
{
  XRMobileAgentDock *v2;
  uint64_t v3;
  NSMutableArray *waitingAgents;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)XRMobileAgentDock;
  v2 = -[XRMobileAgentDock init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    waitingAgents = v2->_waitingAgents;
    v2->_waitingAgents = (NSMutableArray *)v3;

    pthread_mutex_init(&v2->_mutex, 0);
    pthread_cond_init(&v2->_cond, 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_mutex);
  pthread_cond_destroy(&self->_cond);
  v3.receiver = self;
  v3.super_class = (Class)XRMobileAgentDock;
  -[XRMobileAgentDock dealloc](&v3, sel_dealloc);
}

- (void)abandon
{
  _opaque_pthread_mutex_t *p_mutex;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  XRMobileAgent *dockedAgent;

  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  self->_abandoned = 1;
  objc_msgSend_removeAllObjects(self->_waitingAgents, v4, v5, v6, v7);
  dockedAgent = self->_dockedAgent;
  self->_dockedAgent = 0;

  pthread_cond_signal(&self->_cond);
  pthread_mutex_unlock(p_mutex);
}

- (void)receiveMobileAgent:(id)a3
{
  _opaque_pthread_mutex_t *p_mutex;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  if (a3)
  {
    p_mutex = &self->_mutex;
    v5 = a3;
    pthread_mutex_lock(p_mutex);
    objc_msgSend_addObject_(self->_waitingAgents, v6, (uint64_t)v5, v7, v8);

    pthread_cond_signal(&self->_cond);
    pthread_mutex_unlock(p_mutex);
  }
}

- (BOOL)waitForAgentToDock
{
  _opaque_pthread_mutex_t *p_mutex;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  XRMobileAgent *v8;
  XRMobileAgent *dockedAgent;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  do
  {
    objc_msgSend_firstObject(self->_waitingAgents, v4, v5, v6, v7);
    v8 = (XRMobileAgent *)objc_claimAutoreleasedReturnValue();
    dockedAgent = self->_dockedAgent;
    self->_dockedAgent = v8;

    if (self->_dockedAgent)
      objc_msgSend_removeObjectAtIndex_(self->_waitingAgents, v10, 0, v11, v12);
    else
      pthread_cond_wait(&self->_cond, p_mutex);
  }
  while (!self->_dockedAgent);
  pthread_mutex_unlock(p_mutex);
  self->_agentExecuted = 0;
  return self->_dockedAgent != 0;
}

- (void)executeDockedAgent
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  XRMobileAgent *dockedAgent;

  if (!self->_agentExecuted)
  {
    dockedAgent = self->_dockedAgent;
    if (dockedAgent)
    {
      objc_msgSend_hello(dockedAgent, a2, v2, v3, v4);
      self->_agentExecuted = 1;
    }
  }
}

- (void)releaseDockedAgent
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  XRMobileAgent *dockedAgent;

  if (self->_dockedAgent)
  {
    objc_msgSend_executeDockedAgent(self, a2, v2, v3, v4);
    objc_msgSend_goodbye(self->_dockedAgent, v6, v7, v8, v9);
    self->_agentExecuted = 0;
    dockedAgent = self->_dockedAgent;
    self->_dockedAgent = 0;

  }
}

- (XRMobileAgent)dockedAgent
{
  return self->_dockedAgent;
}

- (void)setDockedAgent:(id)a3
{
  objc_storeStrong((id *)&self->_dockedAgent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dockedAgent, 0);
  objc_storeStrong((id *)&self->_waitingAgents, 0);
}

@end
