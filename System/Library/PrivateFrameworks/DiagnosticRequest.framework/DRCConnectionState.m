@implementation DRCConnectionState

void __44___DRCConnectionState_sharedConnectionState__block_invoke()
{
  _DRCConnectionState *v0;
  void *v1;

  v0 = objc_alloc_init(_DRCConnectionState);
  v1 = (void *)sharedConnectionState_connectionState_0;
  sharedConnectionState_connectionState_0 = (uint64_t)v0;

}

void __27___DRCConnectionState_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;

  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81260])
  {
    DPLogHandle_ClientXPCError();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
      _os_signpost_emit_unreliably_with_name_impl();
    goto LABEL_8;
  }
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    DPLogHandle_ClientXPCError();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
LABEL_10:
      _os_signpost_emit_unreliably_with_name_impl();
LABEL_11:

    goto LABEL_12;
  }
  if (MEMORY[0x1D8251448](v3) != MEMORY[0x1E0C812F8])
  {
    DPLogHandle_ClientXPCError();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
      goto LABEL_10;
    goto LABEL_11;
  }
  if (xpc_dictionary_get_uint64(v4, "ServiceMessageType") != 1)
  {
    DPLogHandle_ClientXPCError();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v5))
      goto LABEL_11;
    goto LABEL_10;
  }
  xpc_dictionary_get_uint64(v4, "RejectionType");
  DPLogHandle_ClientXPCError();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
    _os_signpost_emit_unreliably_with_name_impl();

  if (objc_msgSend(*(id *)(a1 + 32), "hasConnection"))
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v6 = objc_claimAutoreleasedReturnValue();
    xpc_connection_cancel((xpc_connection_t)v6);
LABEL_8:

    objc_msgSend(*(id *)(a1 + 32), "setConnection:", 0);
  }
LABEL_12:

}

void __35___DRCConnectionState_sendMessage___block_invoke(uint64_t a1)
{
  _xpc_connection_s *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "hasConnection"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v2, *(xpc_object_t *)(a1 + 40));

  }
}

void __48___DRCConnectionState_sendMessageWithReplySync___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
