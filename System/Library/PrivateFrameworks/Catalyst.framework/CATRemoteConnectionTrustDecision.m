@implementation CATRemoteConnectionTrustDecision

- (void)dealloc
{
  unsigned __int8 v3;
  objc_super v4;

  v3 = atomic_load((unsigned __int8 *)&self->mHasResponded);
  if ((v3 & 1) == 0)
    -[CATRemoteConnectionTrustDecision respondWithDecisionToAllowUntrustedConnection:](self, "respondWithDecisionToAllowUntrustedConnection:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CATRemoteConnectionTrustDecision;
  -[CATRemoteConnectionTrustDecision dealloc](&v4, sel_dealloc);
}

- (CATRemoteConnectionTrustDecision)initWithConnection:(id)a3 trust:(__SecTrust *)a4
{
  id v6;
  CATRemoteConnectionTrustDecision *v7;
  CATRemoteConnectionTrustDecision *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATRemoteConnectionTrustDecision;
  v7 = -[CATRemoteConnectionTrustDecision init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->mConnection, v6);
    objc_storeStrong(&v8->_trust, a4);
  }

  return v8;
}

- (void)respondWithDecisionToAllowUntrustedConnection:(BOOL)a3
{
  _BOOL8 v3;
  BOOL *p_mHasResponded;
  id WeakRetained;

  v3 = a3;
  p_mHasResponded = &self->mHasResponded;
  while (!__ldaxr((unsigned __int8 *)p_mHasResponded))
  {
    if (!__stlxr(1u, (unsigned __int8 *)p_mHasResponded))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->mConnection);
      objc_msgSend(WeakRetained, "trustDecisionDidRespondWithDecisionToAllowUntrustedConnection:", v3);

      return;
    }
  }
  __clrex();
}

- (id)trust
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_trust, 0);
  objc_destroyWeak((id *)&self->mConnection);
}

@end
