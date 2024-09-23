@implementation NETRBClientGetExtName

void ___NETRBClientGetExtName_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;

  if (__NETRBClientValidateClient(*(_BYTE **)(a1 + 48))
    || (v2 = xpc_dictionary_create(0, 0, 0)) == 0)
  {
    NETRBErrorLog();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    v3 = v2;
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3F5uLL);
    xpc_dictionary_set_string(v3, netrbXPCClientID, (const char *)(*(_QWORD *)(a1 + 48) + 32));
    NETRBInfoLog();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 0x40000000;
    v4[2] = ___NETRBClientGetExtName_block_invoke_2;
    v4[3] = &unk_24C37CC30;
    v5 = *(_OWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 56);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = NETRBXPCSetupAndSend(0, v3, (uint64_t)v4);
    xpc_release(v3);
  }
}

uint64_t ___NETRBClientGetExtName_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;
  char *v5;
  const char *string;

  result = NETRBInfoLog();
  if (a2)
  {
    result = xpc_dictionary_get_uint64(a2, netrbXPCResponse);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 2001)
    {
      v5 = *(char **)(a1 + 48);
      string = xpc_dictionary_get_string(a2, netrbXPCExtName);
      return snprintf(v5, 0x10uLL, "%s", string);
    }
  }
  return result;
}

@end
