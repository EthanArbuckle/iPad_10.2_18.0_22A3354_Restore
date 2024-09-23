@implementation GTMTLReplayErrorReplyStream

- (GTMTLReplayErrorReplyStream)initWithObserver:(id)a3
{
  id v5;
  void *v6;
  GTMTLReplayErrorReplyStream *v7;
  objc_super v9;

  v5 = a3;
  +[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", &unk_255D657F0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)GTMTLReplayErrorReplyStream;
  v7 = -[GTXPCDispatcher initWithProtocolMethods:](&v9, sel_initWithProtocolMethods_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_observer, a3);

  return v7;
}

- (void)notifyError_:(id)a3 replyConnection:(id)a4
{
  GTMTLReplayServiceObserver *observer;
  id nserror;

  observer = self->_observer;
  nserror = (id)xpc_dictionary_get_nserror(a3, "error");
  -[GTMTLReplayServiceObserver notifyError:](observer, "notifyError:", nserror);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
