@implementation LPFetcher

- (LPFetcher)init
{
  LPFetcher *v2;
  LPFetcher *v3;
  LPFetcher *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPFetcher;
  v2 = -[LPFetcher init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_loggingID = ++init_nextLoggingID;
    v4 = v2;
  }

  return v3;
}

- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (unsigned)_loggingID
{
  return self->_loggingID;
}

- (LPEvent)_event
{
  return self->_event;
}

- (void)set_event:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (id)userData
{
  return self->_userData;
}

- (void)setUserData:(id)a3
{
  objc_storeStrong(&self->_userData, a3);
}

- (Class)responseClass
{
  return self->_responseClass;
}

- (void)setResponseClass:(Class)a3
{
  objc_storeStrong((id *)&self->_responseClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseClass, 0);
  objc_storeStrong(&self->_userData, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
