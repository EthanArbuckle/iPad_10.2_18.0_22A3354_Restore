@implementation MRServiceHandleAgentMessage

void ___MRServiceHandleAgentMessage_block_invoke(uint64_t a1)
{
  uint64_t uint64;
  void *v3;
  _QWORD *v4;
  uint64_t (*v5)(_QWORD);
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  xpc_object_t reply;
  void *v11;
  _xpc_connection_s *v12;
  xpc_object_t xdict;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "MRXPC_MESSAGE_ID_KEY");
  if (uint64 == 0xA00000000000002)
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(_QWORD **)(a1 + 48);
    xdict = *(id *)(a1 + 32);
    if (v4)
    {
      v5 = (uint64_t (*)(_QWORD))v4[1];
      if (v5)
        v4 = (_QWORD *)v5(*v4);
      else
        v4 = 0;
    }
    v8 = v3;
    xpc_dictionary_get_remote_connection(xdict);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      reply = xpc_dictionary_create_reply(xdict);
      v11 = reply;
      if (reply)
      {
        xpc_dictionary_set_uint64(reply, "MRXPC_AGENT_NUMBER_ACTIVE_CALLS_KEY", (uint64_t)v4);
        objc_msgSend(v8, "connection");
        v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        xpc_connection_send_message(v12, v11);

      }
    }

  }
  else
  {
    v6 = uint64;
    _MRLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v15 = v6;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "Agent client message %lu not handled", buf, 0xCu);
    }

  }
}

@end
