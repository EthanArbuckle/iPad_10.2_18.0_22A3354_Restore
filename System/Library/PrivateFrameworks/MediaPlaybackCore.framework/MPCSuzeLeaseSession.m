@implementation MPCSuzeLeaseSession

- (MPCSuzeLeaseSession)initWithICSuzeLeaseSession:(id)a3
{
  id v5;
  MPCSuzeLeaseSession *v6;
  MPCSuzeLeaseSession *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCSuzeLeaseSession;
  v6 = -[MPCSuzeLeaseSession init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_icSuzeLeaseSession, a3);

  return v7;
}

- (void)beginAutomaticallyRefreshingLease
{
  -[ICSuzeLeaseSession beginAutomaticallyRefreshingLease](self->_icSuzeLeaseSession, "beginAutomaticallyRefreshingLease");
}

- (void)endAutomaticallyRefreshingLease
{
  -[ICSuzeLeaseSession endAutomaticallyRefreshingLease](self->_icSuzeLeaseSession, "endAutomaticallyRefreshingLease");
}

- (ICSuzeLeaseSession)icSuzeLeaseSession
{
  return self->_icSuzeLeaseSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icSuzeLeaseSession, 0);
}

@end
