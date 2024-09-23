@implementation EKEventFetchRequestToken

- (EKEventFetchRequestToken)initWithEventStore:(id)a3 token:(int)a4
{
  id v6;
  EKEventFetchRequestToken *v7;
  EKEventFetchRequestToken *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKEventFetchRequestToken;
  v7 = -[EKEventFetchRequestToken init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_eventStore, v6);
    v8->_token = a4;
  }

  return v8;
}

- (void)cancel
{
  void *v3;
  id v4;

  -[EKEventFetchRequestToken eventStore](self, "eventStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRemoteOperation:", -[EKEventFetchRequestToken token](self, "token"));

}

- (EKEventStore)eventStore
{
  return (EKEventStore *)objc_loadWeakRetained((id *)&self->_eventStore);
}

- (unsigned)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eventStore);
}

@end
