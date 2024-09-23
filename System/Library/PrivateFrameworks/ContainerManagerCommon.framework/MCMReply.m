@implementation MCMReply

- (MCMReply)initWithXpcReply:(id)a3 slowWorkloop:(id)a4 fastWorkloop:(id)a5 resultPromise:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MCMReply *v15;
  MCMReply *v16;
  objc_super v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MCMReply;
  v15 = -[MCMReply init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_xpcReply, a3);
    objc_storeStrong((id *)&v16->_slowWorkloop, a4);
    objc_storeStrong((id *)&v16->_fastWorkloop, a5);
    objc_storeStrong((id *)&v16->_resultPromise, a6);
    *(_WORD *)&v16->_replySent = 0;
  }

  return v16;
}

- (void)send
{
  void *v2;
  int v3;
  MCMReply *obj;

  obj = self;
  objc_sync_enter(obj);
  -[MCMReply resultPromise](obj, "resultPromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "complete");

  if (v3 && !obj->_replySent)
  {
    obj->_replySent = 1;
    objc_sync_exit(obj);

    -[MCMReply _send](obj, "_send");
  }
  else
  {
    objc_sync_exit(obj);

  }
}

- (void)_send
{
  MCMReply *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _xpc_connection_s *v7;
  NSObject *v8;
  uint8_t v9[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[MCMReply xpcReply](v2, "xpcReply");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMReply resultPromise](v2, "resultPromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    _os_crash();
    __break(1u);
  }
  objc_msgSend(v5, "encodeResultOntoReply:", v3);
  -[MCMReply invalidate](v2, "invalidate");

  objc_sync_exit(v2);
  xpc_dictionary_get_remote_connection(v3);
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v7, v3);
  if (-[MCMReply exitAfterSend](v2, "exitAfterSend"))
  {
    container_log_handle_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1CF807000, v8, OS_LOG_TYPE_DEFAULT, "EXITING AFTER REPLYING", v9, 2u);
    }

    xpc_connection_send_barrier(v7, &__block_literal_global_8355);
  }

}

- (BOOL)exitAfterSend
{
  return self->_exitAfterSend;
}

- (OS_xpc_object)xpcReply
{
  return self->_xpcReply;
}

- (void)invalidate
{
  OS_xpc_object *xpcReply;
  OS_dispatch_queue *slowWorkloop;
  OS_dispatch_queue *fastWorkloop;
  MCMResultPromise *resultPromise;

  self->_replySent = 1;
  xpcReply = self->_xpcReply;
  self->_xpcReply = 0;

  slowWorkloop = self->_slowWorkloop;
  self->_slowWorkloop = 0;

  fastWorkloop = self->_fastWorkloop;
  self->_fastWorkloop = 0;

  resultPromise = self->_resultPromise;
  self->_resultPromise = 0;

}

- (MCMResultPromise)resultPromise
{
  return self->_resultPromise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultPromise, 0);
  objc_storeStrong((id *)&self->_fastWorkloop, 0);
  objc_storeStrong((id *)&self->_slowWorkloop, 0);
  objc_storeStrong((id *)&self->_xpcReply, 0);
}

- (void)handoffToSlowWorkloopforClientIdentity:(id)a3 withBlock:(id)a4
{
  id v5;
  MCMReply *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = self;
  objc_sync_enter(v6);
  v6->_replySent = 1;
  objc_sync_exit(v6);

  -[MCMReply xpcReply](v6, "xpcReply");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMReply slowWorkloop](v6, "slowWorkloop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  xpc_dictionary_handoff_reply();

}

- (void)encodeResult:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MCMReply xpcReply](self, "xpcReply");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeResultOntoReply:");

}

- (void)dispatchSyncToFastWorkloopWithBlock:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[MCMReply fastWorkloop](self, "fastWorkloop");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async_and_wait(v5, v4);

}

- (OS_dispatch_queue)slowWorkloop
{
  return self->_slowWorkloop;
}

- (OS_dispatch_queue)fastWorkloop
{
  return self->_fastWorkloop;
}

- (void)setExitAfterSend:(BOOL)a3
{
  self->_exitAfterSend = a3;
}

void __17__MCMReply__send__block_invoke()
{
  exit(0);
}

uint64_t __61__MCMReply_handoffToSlowWorkloopforClientIdentity_withBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D17D7010]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_send");
}

@end
