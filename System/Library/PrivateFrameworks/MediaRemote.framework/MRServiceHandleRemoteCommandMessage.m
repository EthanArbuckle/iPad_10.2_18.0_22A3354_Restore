@implementation MRServiceHandleRemoteCommandMessage

void ___MRServiceHandleRemoteCommandMessage_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _xpc_connection_s *v4;
  xpc_object_t reply;
  NSObject *v6;
  void *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v3 = a2;
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
    {
      _MRLogForCategory(2uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionCommandID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hash");

      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        *(_WORD *)v10 = 0;
        _os_signpost_emit_with_name_impl(&dword_193827000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SendCommandXPCResultFromApp", ", v10, 2u);
      }

      MRAddCommandResultToXPCMessage(reply, v3);
      xpc_connection_send_message(v4, reply);
    }

  }
  if (*(_QWORD *)(a1 + 48) != -1 && sandbox_extension_release() == -1)
  {
    _MRLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      ___MRServiceHandleRemoteCommandMessage_block_invoke_cold_1();

  }
}

void ___MRServiceHandleRemoteCommandMessage_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_0(&dword_193827000, v0, v1, "Failed to release sandbox extension.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
