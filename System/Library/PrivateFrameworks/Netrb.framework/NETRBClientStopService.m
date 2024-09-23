@implementation NETRBClientStopService

void ___NETRBClientStopService_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  _OWORD *v4;
  NSObject *v5;
  _QWORD v6[5];

  if (!__NETRBClientValidateClient(*(_BYTE **)(a1 + 40))
    && *(_BYTE *)(*(_QWORD *)(a1 + 40) + 289)
    && (v2 = xpc_dictionary_create(0, 0, 0)) != 0)
  {
    v3 = v2;
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3EAuLL);
    xpc_dictionary_set_string(v3, netrbXPCClientID, (const char *)(*(_QWORD *)(a1 + 40) + 32));
    NETRBInfoLog();
    v4 = (_OWORD *)(*(_QWORD *)(a1 + 40) + 289);
    v4[14] = 0u;
    v4[15] = 0u;
    v4[12] = 0u;
    v4[13] = 0u;
    v4[10] = 0u;
    v4[11] = 0u;
    v4[8] = 0u;
    v4[9] = 0u;
    v4[6] = 0u;
    v4[7] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    *v4 = 0u;
    v4[1] = 0u;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = ___NETRBClientStopService_block_invoke_2;
    v6[3] = &__block_descriptor_tmp_83_0;
    v5 = *(NSObject **)(a1 + 48);
    v6[4] = *(_QWORD *)(a1 + 40);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = NETRBXPCSetupAndSend(v5, v3, (uint64_t)v6);
    xpc_release(v3);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      CFRetain(*(CFTypeRef *)(a1 + 40));
  }
  else
  {
    NETRBErrorLog();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

void ___NETRBClientStopService_block_invoke_2(uint64_t a1, void *a2)
{
  __NETRBClientResponseHandler(*(_QWORD *)(a1 + 32), 1002, a2, *(_QWORD *)(a1 + 32) + 289);
}

@end
