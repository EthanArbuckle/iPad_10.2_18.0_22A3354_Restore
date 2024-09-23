@implementation AXUIMessageReplyHandler

+ (id)createReplyObject:(id)a3 fromMessage:(id)a4 withError:(id)a5
{
  unint64_t v7;
  id v8;
  unint64_t v9;
  void *v10;
  id v11;
  xpc_object_t reply;
  __CFString *v13;
  __CFString *v14;
  NSObject *v15;
  const char *v16;
  __CFString *v17;
  const char *v18;
  __CFString *v19;
  id v21;

  v7 = (unint64_t)a3;
  v8 = a4;
  v9 = (unint64_t)a5;
  if (!v7
    || (v21 = (id)v9,
        v10 = (void *)objc_msgSend(MEMORY[0x24BDFE500], "copyXPCMessageFromDictionary:inReplyToXPCMessage:error:", v7, v8, &v21), v11 = v21, (id)v9, v9 = (unint64_t)v11, !v10))
  {
    reply = xpc_dictionary_create_reply(v8);
    v10 = reply;
    if (reply)
    {
      if (v7 | v9)
      {
        objc_msgSend((id)v9, "domain");
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v9, "localizedDescription");
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          v13 = CFSTR("AXUIErrorDomainCommunication");
        if (!v14)
          v14 = CFSTR("Unexpected error converting reply to an XPC object.");
        AXLogUI();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          +[AXUIMessageReplyHandler createReplyObject:fromMessage:withError:].cold.1((uint64_t)v13, (uint64_t)v14, v15);

        v16 = _AXUIMessageReplyKeyErrorDomain[0];
        v17 = objc_retainAutorelease(v13);
        xpc_dictionary_set_string(v10, v16, (const char *)-[__CFString UTF8String](v17, "UTF8String"));
        v18 = _AXUIMessageReplyKeyErrorDescription[0];
        v19 = objc_retainAutorelease(v14);
        xpc_dictionary_set_string(v10, v18, (const char *)-[__CFString UTF8String](v19, "UTF8String"));

      }
      else
      {
        xpc_dictionary_set_BOOL(reply, _AXUIMessageReplyKeyDidSucceed[0], 1);
        v9 = 0;
      }
    }
  }

  return v10;
}

+ (void)sendReply:(id)a3 withError:(id)a4 andOriginalXPCMessage:(id)a5 usingConnection:(id)a6 customDataAddingBlock:(id)a7
{
  id v12;
  void (**v13)(id, void *);
  void *v14;
  void *v15;
  _xpc_connection_s *v16;
  void *v17;
  id v18;

  v18 = a5;
  v12 = a6;
  v13 = (void (**)(id, void *))a7;
  objc_msgSend(a1, "createReplyObject:fromMessage:withError:", a3, v18, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v13)
      v13[2](v13, v14);
    objc_msgSend(v12, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v12, "connection");
      v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v16, v14);
    }
    else
    {
      objc_msgSend(v12, "serviceConnection");
      v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      -[_xpc_connection_s remoteTarget](v16, "remoteTarget");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sendBoardServiceMessage:callback:", v18, &__block_literal_global_0);

    }
  }

}

+ (void)createReplyObject:(uint64_t)a1 fromMessage:(uint64_t)a2 withError:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_213298000, log, OS_LOG_TYPE_ERROR, "Unexpected error with domain %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
