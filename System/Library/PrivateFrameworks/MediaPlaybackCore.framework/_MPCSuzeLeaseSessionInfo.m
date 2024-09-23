@implementation _MPCSuzeLeaseSessionInfo

- (_MPCSuzeLeaseSessionInfo)initWithICLeaseSession:(id)a3
{
  id v5;
  _MPCSuzeLeaseSessionInfo *v6;
  _MPCSuzeLeaseSessionInfo *v7;
  MPCSuzeLeaseSession *v8;
  MPCSuzeLeaseSession *mpcLeaseSession;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MPCSuzeLeaseSessionInfo;
  v6 = -[_MPCSuzeLeaseSessionInfo init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_icLeaseSession, a3);
    v8 = -[MPCSuzeLeaseSession initWithICSuzeLeaseSession:]([MPCSuzeLeaseSession alloc], "initWithICSuzeLeaseSession:", v7->_icLeaseSession);
    mpcLeaseSession = v7->_mpcLeaseSession;
    v7->_mpcLeaseSession = v8;

  }
  return v7;
}

- (int64_t)clientCount
{
  return self->_clientCount;
}

- (void)setClientCount:(int64_t)a3
{
  self->_clientCount = a3;
}

- (ICSuzeLeaseSession)icLeaseSession
{
  return self->_icLeaseSession;
}

- (MPCSuzeLeaseSession)mpcLeaseSession
{
  return self->_mpcLeaseSession;
}

- (BOOL)shouldStopWhenFinished
{
  return self->_shouldStopWhenFinished;
}

- (void)setShouldStopWhenFinished:(BOOL)a3
{
  self->_shouldStopWhenFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mpcLeaseSession, 0);
  objc_storeStrong((id *)&self->_icLeaseSession, 0);
}

@end
