@implementation GTLoopbackReplyStream

- (GTLoopbackReplyStream)initWithCallback:(id)a3
{
  id v4;
  GTLoopbackReplyStream *v5;
  uint64_t v6;
  id callback;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTLoopbackReplyStream;
  v5 = -[GTLoopbackReplyStream init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x22E30CB48](v4);
    callback = v5->_callback;
    v5->_callback = (id)v6;

  }
  return v5;
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  id v6;
  id nsdictionary_any;
  void *v8;
  xpc_object_t xdict;

  xdict = a3;
  v6 = a4;
  nsdictionary_any = xpc_dictionary_get_nsdictionary_any(xdict, "data");
  (*((void (**)(void))self->_callback + 2))();
  if (MessageHasReply(xdict))
  {
    gt_xpc_dictionary_create_reply(xdict);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendMessage:", v8);

  }
  if (xpc_dictionary_get_BOOL(xdict, "_endOfStream"))
    objc_msgSend(v6, "deregisterDispatcher:", self->dispatcherId);

}

- (unint64_t)dispatcherId
{
  return self->dispatcherId;
}

- (void)setDispatcherId:(unint64_t)a3
{
  self->dispatcherId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
}

@end
