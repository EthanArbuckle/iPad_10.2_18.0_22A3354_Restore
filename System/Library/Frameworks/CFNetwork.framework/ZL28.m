@implementation ZL28

_DWORD *___ZL28_tcp_listener_AcceptCallbackPvPU28objcproto17OS_tcp_connection8NSObject_block_invoke(_DWORD *result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  _DWORD *v4;
  int v5;
  uint64_t v6;
  _QWORD v7[7];
  int v8;
  uint64_t v9;
  uint64_t v10;

  if (a2 == 1)
  {
    v9 = v2;
    v10 = v3;
    v4 = result;
    v5 = tcp_connection_copy_socket();
    result = (_DWORD *)tcp_connection_cancel();
    v6 = *((_QWORD *)v4 + 5);
    if (*(_QWORD *)(v6 + 64))
    {
      result = *(_DWORD **)(v6 + 56);
      if (result[10])
      {
        v7[6] = 0;
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = ___ZL19_ServerHandleAcceptP6Serveri_block_invoke;
        v7[3] = &__block_descriptor_60_e5_v8__0l;
        v7[4] = v6;
        v7[5] = 0;
        v8 = v5;
        return (_DWORD *)(*(uint64_t (**)(_DWORD *, _QWORD *))(*(_QWORD *)result + 96))(result, v7);
      }
    }
  }
  return result;
}

@end
