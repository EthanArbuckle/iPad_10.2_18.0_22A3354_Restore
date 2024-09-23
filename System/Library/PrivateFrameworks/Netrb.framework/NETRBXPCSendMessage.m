@implementation NETRBXPCSendMessage

uint64_t ____NETRBXPCSendMessage_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t (*v5)(void);

  if (a2)
  {
    v4 = MEMORY[0x20BD2C430](a2);
    if (v4 == MEMORY[0x24BDACFA0])
    {
      if (xpc_dictionary_get_uint64(a2, netrbXPCResponse) != 2002)
      {
LABEL_10:
        v5 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
        return v5();
      }
    }
    else if (v4 == MEMORY[0x24BDACFB8])
    {
      xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
    }
    NETRBErrorLog();
    NETRBXPCCleanup();
    goto LABEL_10;
  }
  NETRBXPCCleanup();
  NETRBErrorLog();
  v5 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  return v5();
}

@end
