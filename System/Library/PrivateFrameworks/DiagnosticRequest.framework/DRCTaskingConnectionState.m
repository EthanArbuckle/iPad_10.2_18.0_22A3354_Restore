@implementation DRCTaskingConnectionState

void __51___DRCTaskingConnectionState_sharedConnectionState__block_invoke()
{
  _DRCTaskingConnectionState *v0;
  void *v1;

  v0 = objc_alloc_init(_DRCTaskingConnectionState);
  v1 = (void *)sharedConnectionState_connectionState;
  sharedConnectionState_connectionState = (uint64_t)v0;

}

void __34___DRCTaskingConnectionState_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81260])
  {
    DPLogHandle_ClientTaskingXPCError();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingConnectionInvalid", "Invalid service connection", (uint8_t *)&v11, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  }
  else
  {
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      DPLogHandle_ClientTaskingXPCError();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v5))
      {
        LOWORD(v11) = 0;
        v6 = "TaskingConnectionInterrupted";
        v7 = "Service connection interrupted";
        goto LABEL_11;
      }
LABEL_12:

      goto LABEL_13;
    }
    if (MEMORY[0x1D8251448](v3) != MEMORY[0x1E0C812F8])
    {
      DPLogHandle_ClientTaskingXPCError();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v5))
      {
        LOWORD(v11) = 0;
        v6 = "UnexpectedTaskingMessageObjectType";
        v7 = "Unexpected object type from the service";
LABEL_11:
        _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v6, v7, (uint8_t *)&v11, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    v9 = (void *)MEMORY[0x1D82513A0](v4);
    DPLogHandle_ClientTaskingXPCError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      v11 = 136446210;
      v12 = v9;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedUnexpectedServiceMessage", "Received an unexpected standalone message from the service: %{public}s", (uint8_t *)&v11, 0xCu);
    }

    if (v9)
      free(v9);
  }
LABEL_13:

}

void __42___DRCTaskingConnectionState_sendMessage___block_invoke(uint64_t a1)
{
  _xpc_connection_s *v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isClosed") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v2, *(xpc_object_t *)(a1 + 40));

  }
}

uint64_t __55___DRCTaskingConnectionState_sendMessageWithReplySync___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isClosed");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
