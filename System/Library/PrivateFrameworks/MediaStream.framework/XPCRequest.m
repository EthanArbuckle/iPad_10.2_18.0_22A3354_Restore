@implementation XPCRequest

- (void)sendReply
{
  (*((void (**)(void))self->_handler + 2))();
}

- (XPCRequest)initWithMessage:(id)a3 sequence:(unint64_t)a4 connection:(id)a5
{
  id v9;
  id v10;
  XPCRequest *v11;
  xpc_object_t reply;
  id v13;
  uint64_t v14;
  id handler;
  XPCRequest *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21[2];
  id location;
  objc_super v23;

  v9 = a3;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)XPCRequest;
  v11 = -[XPCRequest init](&v23, sel_init);
  if (v11)
  {
    reply = xpc_dictionary_create_reply(v9);
    objc_storeStrong((id *)&v11->_reply, reply);
    objc_storeStrong((id *)&v11->_message, a3);
    v11->_sequence = a4;
    objc_initWeak(&location, v11);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __50__XPCRequest_initWithMessage_sequence_connection___block_invoke;
    v18[3] = &unk_1E994DB98;
    v19 = reply;
    v21[1] = (id)a4;
    v20 = v10;
    v13 = reply;
    objc_copyWeak(v21, &location);
    v14 = MEMORY[0x1D826FEFC](v18);
    handler = v11->_handler;
    v11->_handler = (id)v14;

    v16 = v11;
    objc_destroyWeak(v21);

    objc_destroyWeak(&location);
  }

  return v11;
}

- (unint64_t)sequence
{
  return self->_sequence;
}

- (OS_xpc_object)message
{
  return self->_message;
}

- (OS_xpc_object)reply
{
  return self->_reply;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong(&self->_handler, 0);
}

void __50__XPCRequest_initWithMessage_sequence_connection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;

  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "__xpcseq", *(_QWORD *)(a1 + 56));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  if (_shouldLogBlock)
  {
    if ((*(unsigned int (**)(void))(_shouldLogBlock + 16))())
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      _XPCLog(7, CFSTR("%@ Sent reply to request."), v2, v3, v4, v5, v6, v7, (uint64_t)WeakRetained);

    }
  }
}

@end
