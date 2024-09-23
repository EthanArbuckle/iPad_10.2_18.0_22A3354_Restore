@implementation GTLoopbackServiceXPCDispatcher

- (GTLoopbackServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7;
  void *v8;
  GTLoopbackServiceXPCDispatcher *v9;
  objc_super v11;

  v7 = a3;
  objc_msgSend(a4, "protocolMethods");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)GTLoopbackServiceXPCDispatcher;
  v9 = -[GTXPCDispatcher initWithProtocolMethods:](&v11, sel_initWithProtocolMethods_, v8);

  if (v9)
    objc_storeStrong((id *)&v9->_service, a3);

  return v9;
}

- (void)echo_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id nsdictionary_any;

  v6 = a4;
  v7 = a3;
  nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "data");
  -[GTLoopbackService echo:](self->_service, "echo:", nsdictionary_any);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  gt_xpc_dictionary_create_reply(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_nsobject(v9, "data", (uint64_t)v8);
  objc_msgSend(v6, "sendMessage:", v9);

}

- (void)echo_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  id nsdictionary_any;
  void *v9;
  GTLoopbackService *service;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a4;
  v7 = a3;
  nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "data");
  gt_xpc_dictionary_create_reply(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  service = self->_service;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __74__GTLoopbackServiceXPCDispatcher_echo_completionHandler__replyConnection___block_invoke;
  v13[3] = &unk_24F827E70;
  v14 = v9;
  v15 = v6;
  v11 = v6;
  v12 = v9;
  -[GTLoopbackService echo:completionHandler:](service, "echo:completionHandler:", nsdictionary_any, v13);

}

uint64_t __74__GTLoopbackServiceXPCDispatcher_echo_completionHandler__replyConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nsobject(*(void **)(a1 + 32), "data", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

- (void)echo_repeat_callback_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  id nsdictionary_any;
  uint64_t uint64;
  uint64_t v10;
  void *v11;
  GTLoopbackService *service;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];

  v6 = a4;
  v7 = a3;
  nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "data");
  uint64 = xpc_dictionary_get_uint64(v7, "repeat");
  v10 = xpc_dictionary_get_uint64(v7, "_replyStreamId");
  xpc_dictionary_get_array(v7, "_pathHistory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  service = self->_service;
  v21[3] = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__GTLoopbackServiceXPCDispatcher_echo_repeat_callback__replyConnection___block_invoke;
  v15[3] = &unk_24F827E98;
  v18 = v21;
  v19 = v10;
  v20 = uint64;
  v16 = v11;
  v17 = v6;
  v13 = v6;
  v14 = v11;
  -[GTLoopbackService echo:repeat:callback:](service, "echo:repeat:callback:", nsdictionary_any, uint64, v15);

  _Block_object_dispose(v21, 8);
}

void __72__GTLoopbackServiceXPCDispatcher_echo_repeat_callback__replyConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  xpc_object_t xdict;

  v3 = a2;
  xdict = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(xdict, "_port", *(_QWORD *)(a1 + 56));
  xpc_dictionary_set_value(xdict, "_replyPath", *(xpc_object_t *)(a1 + 32));
  xpc_dictionary_set_nsobject(xdict, "data", (uint64_t)v3);

  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == *(_QWORD *)(a1 + 64))
    xpc_dictionary_set_BOOL(xdict, "_endOfStream", 1);
  objc_msgSend(*(id *)(a1 + 40), "sendMessage:", xdict);

}

- (void)echo_repeat_callback_complete_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  id nsdictionary_any;
  uint64_t uint64;
  uint64_t v10;
  void *v11;
  void *v12;
  GTLoopbackService *service;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;

  v6 = a4;
  v7 = a3;
  nsdictionary_any = xpc_dictionary_get_nsdictionary_any(v7, "data");
  uint64 = xpc_dictionary_get_uint64(v7, "repeat");
  v10 = xpc_dictionary_get_uint64(v7, "_replyStreamId");
  xpc_dictionary_get_array(v7, "_pathHistory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  gt_xpc_dictionary_create_reply(v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  service = self->_service;
  v14 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __81__GTLoopbackServiceXPCDispatcher_echo_repeat_callback_complete__replyConnection___block_invoke;
  v21[3] = &unk_24F827EC0;
  v24 = v10;
  v22 = v11;
  v23 = v6;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __81__GTLoopbackServiceXPCDispatcher_echo_repeat_callback_complete__replyConnection___block_invoke_2;
  v18[3] = &unk_24F827E70;
  v19 = v12;
  v20 = v23;
  v15 = v23;
  v16 = v12;
  v17 = v11;
  -[GTLoopbackService echo:repeat:callback:complete:](service, "echo:repeat:callback:complete:", nsdictionary_any, uint64, v21, v18);

}

void __81__GTLoopbackServiceXPCDispatcher_echo_repeat_callback_complete__replyConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  xpc_object_t xdict;

  v3 = a2;
  xdict = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(xdict, "_port", *(_QWORD *)(a1 + 48));
  xpc_dictionary_set_value(xdict, "_replyPath", *(xpc_object_t *)(a1 + 32));
  xpc_dictionary_set_nsobject(xdict, "data", (uint64_t)v3);

  MessageSetHasReply(xdict);
  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "sendMessageWithReplySync:error:", xdict, 0);

}

uint64_t __81__GTLoopbackServiceXPCDispatcher_echo_repeat_callback_complete__replyConnection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  xpc_dictionary_set_BOOL(v3, "_endOfStream", 1);
  xpc_dictionary_set_nsobject(*(void **)(a1 + 32), "result", (uint64_t)v4);

  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
