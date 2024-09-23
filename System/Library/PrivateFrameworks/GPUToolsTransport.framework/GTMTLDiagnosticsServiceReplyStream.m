@implementation GTMTLDiagnosticsServiceReplyStream

- (GTMTLDiagnosticsServiceReplyStream)initWithObserver:(id)a3
{
  id v5;
  void *v6;
  GTMTLDiagnosticsServiceReplyStream *v7;
  objc_super v9;

  v5 = a3;
  +[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", &unk_255D64510);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)GTMTLDiagnosticsServiceReplyStream;
  v7 = -[GTXPCDispatcher initWithProtocolMethods:](&v9, sel_initWithProtocolMethods_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_observer, a3);

  return v7;
}

- (void)notifyCommandBufferIssue_:(id)a3 replyConnection:(id)a4
{
  id v5;
  uint64_t v6;
  id nsobject;

  v5 = a3;
  v6 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v5, "issue", v6);

  -[GTMTLDiagnosticsServiceObserver notifyCommandBufferIssue:](self->_observer, "notifyCommandBufferIssue:", nsobject);
}

- (void)notifyDiagnosticsIssue_:(id)a3 replyConnection:(id)a4
{
  id v5;
  uint64_t v6;
  id nsobject;

  v5 = a3;
  v6 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v5, "issue", v6);

  -[GTMTLDiagnosticsServiceObserver notifyDiagnosticsIssue:](self->_observer, "notifyDiagnosticsIssue:", nsobject);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
