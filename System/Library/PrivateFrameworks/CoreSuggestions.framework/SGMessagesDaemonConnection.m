@implementation SGMessagesDaemonConnection

- (SGMessagesDaemonConnection)initWithDaemonConnectionFuture:(id)a3
{
  id v5;
  SGMessagesDaemonConnection *v6;
  SGMessagesDaemonConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGMessagesDaemonConnection;
  v6 = -[SGMessagesDaemonConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_daemonConnectionFuture, a3);

  return v7;
}

- (id)remoteSuggestionManagerWithErrorHandler:(id)a3
{
  SGDSuggestManagerMessagesProtocol *remoteSuggestionManagerForTesting;
  SGDSuggestManagerMessagesProtocol *v4;
  SGFuture *daemonConnectionFuture;
  id v7;
  id v8;
  void *v9;

  remoteSuggestionManagerForTesting = self->_remoteSuggestionManagerForTesting;
  if (remoteSuggestionManagerForTesting)
  {
    v4 = remoteSuggestionManagerForTesting;
  }
  else
  {
    daemonConnectionFuture = self->_daemonConnectionFuture;
    v7 = a3;
    v8 = -[SGFuture wait](daemonConnectionFuture, "wait");
    -[SGFuture result](self->_daemonConnectionFuture, "result");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v7);
    v4 = (SGDSuggestManagerMessagesProtocol *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)setManagerForTesting:(id)a3
{
  objc_storeStrong((id *)&self->_remoteSuggestionManagerForTesting, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteSuggestionManagerForTesting, 0);
  objc_storeStrong((id *)&self->_daemonConnectionFuture, 0);
}

@end
