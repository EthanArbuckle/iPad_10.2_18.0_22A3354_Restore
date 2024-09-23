@implementation BSXPCServiceConnectionMessageReply

- (BSXPCServiceConnectionMessageReply)initWithMessage:(id)a3
{
  id v4;
  void *v5;
  BSXPCServiceConnectionMessageReply *reply;
  objc_super v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    reply = (BSXPCServiceConnectionMessageReply *)xpc_dictionary_create_reply(v4);
    if (reply)
    {
      v8.receiver = self;
      v8.super_class = (Class)BSXPCServiceConnectionMessageReply;
      self = -[BSXPCServiceConnectionMessage initWithMessage:](&v8, sel_initWithMessage_, reply);

      reply = self;
    }
  }
  else
  {
    reply = 0;
  }

  return reply;
}

@end
