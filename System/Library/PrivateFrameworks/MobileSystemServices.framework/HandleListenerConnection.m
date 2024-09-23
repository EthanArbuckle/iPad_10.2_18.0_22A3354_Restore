@implementation HandleListenerConnection

uint64_t ___HandleListenerConnection_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void ___HandleListenerConnection_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _xpc_connection_s *v17;
  char string;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *context;

  v11 = MEMORY[0x1E0BFF4F4](a2);
  if (v11 == MEMORY[0x1E0C812F8])
  {
    _HandleIncomingMessage(*(_QWORD *)(a1 + 32), *(_xpc_connection_s **)(a1 + 40), a2, v12, v13, v14, v15, v16, a9);
  }
  else if (v11 == MEMORY[0x1E0C81310])
  {
    v17 = *(_xpc_connection_s **)(a1 + 40);
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E0C81270]);
    if (a2 == (void *)MEMORY[0x1E0C81260])
    {
      context = xpc_connection_get_context(v17);
      if (context)
      {
        xpc_release(context);
        xpc_connection_set_context(v17, 0);
      }
      MEMORY[0x1E0BFF524]();
      xpc_connection_cancel(v17);
      xpc_release(v17);
    }
    else
    {
      MOLogWrite(0, 3, (uint64_t)"_HandleClientError", CFSTR("client connection error: %s"), v19, v20, v21, v22, string);
    }
  }
  else
  {
    MOLogWrite(0, 3, (uint64_t)"_HandleListenerConnection_block_invoke_2", CFSTR("ignoring unknown event type from client"), v13, v14, v15, v16, a9);
  }
}

@end
