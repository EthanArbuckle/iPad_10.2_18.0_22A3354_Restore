@implementation HAP2CoAPIOThreadSessionQueueEntry

- (HAP2CoAPIOThreadSessionQueueEntry)initWithSession:(coap_session_t *)a3 startTime:(id)a4
{
  id v7;
  HAP2CoAPIOThreadSessionQueueEntry *v8;
  HAP2CoAPIOThreadSessionQueueEntry *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HAP2CoAPIOThreadSessionQueueEntry;
  v8 = -[HAP2CoAPIOThreadSessionQueueEntry init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_startTime, a4);
    v9->_session = a3;
  }

  return v9;
}

- (BOOL)reapSession:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  coap_session_t *session;
  BOOL v9;

  v4 = a3;
  if (self->_session)
  {
    -[HAP2CoAPIOThreadSessionQueueEntry startTime](self, "startTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6;

    session = self->_session;
    if (v7 >= 60.0)
    {
      coap_session_release((uint64_t)session);
      session = 0;
      self->_session = 0;
    }
  }
  else
  {
    session = 0;
  }
  v9 = session == 0;

  return v9;
}

- (coap_session_t)session
{
  return self->_session;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
