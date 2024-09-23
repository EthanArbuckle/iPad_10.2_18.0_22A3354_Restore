@implementation GTBulkDataReplyStream

- (GTBulkDataReplyStream)initWithCallback:(id)a3
{
  id v4;
  GTBulkDataReplyStream *v5;
  uint64_t v6;
  id callback;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTBulkDataReplyStream;
  v5 = -[GTBulkDataReplyStream init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x22E30CB48](v4);
    callback = v5->_callback;
    v5->_callback = (id)v6;

    v5->_dispatcherId = 0;
  }

  return v5;
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  id v6;
  void *v7;
  void *nsdata;
  BOOL v9;
  void *nserror;
  xpc_object_t xdict;

  xdict = a3;
  v6 = a4;
  if (MessageHasReply(xdict))
  {
    gt_xpc_dictionary_create_reply(xdict);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendMessage:", v7);

  }
  nsdata = (void *)xpc_dictionary_get_nsdata(xdict, "chunk");
  v9 = xpc_dictionary_get_BOOL(xdict, "isFinalChunk");
  nserror = (void *)xpc_dictionary_get_nserror(xdict, "error");
  (*((void (**)(void))self->_callback + 2))();
  if (!nsdata || v9 || nserror)
    objc_msgSend(v6, "deregisterDispatcher:", -[GTBulkDataReplyStream dispatcherId](self, "dispatcherId"));

}

- (unint64_t)dispatcherId
{
  return self->_dispatcherId;
}

- (void)setDispatcherId:(unint64_t)a3
{
  self->_dispatcherId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
}

@end
