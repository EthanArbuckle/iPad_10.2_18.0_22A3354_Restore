@implementation FigTransportConnectionXPCSetCurrentConnection

void __FigTransportConnectionXPCSetCurrentConnection_block_invoke(uint64_t a1, uint64_t a2, OpaqueCMBlockBuffer *a3)
{
  uint64_t v5;
  void *v6;
  _xpc_connection_s *v7;
  const void *v8;
  void (**v9)(void *, _QWORD, OpaqueCMBlockBuffer *);
  xpc_object_t xdict;

  v5 = *(_QWORD *)(a1 + 32);
  xdict = 0;
  FigSimpleMutexLock(*(pthread_mutex_t **)(v5 + 24));
  v6 = *(void **)(v5 + 8);
  if (v6)
    v7 = (_xpc_connection_s *)xpc_retain(v6);
  else
    v7 = 0;
  v8 = *(const void **)(v5 + 16);
  if (v8)
    v9 = (void (**)(void *, _QWORD, OpaqueCMBlockBuffer *))_Block_copy(v8);
  else
    v9 = 0;
  FigSimpleMutexUnlock(*(pthread_mutex_t **)(v5 + 24));
  if (v7)
  {
    if (!FigXPCCreateBasicMessage(0x656D7367u, 0, &xdict))
    {
      xpc_dictionary_set_int64(xdict, (const char *)kNeroTransportConnectionEventHandler_Type, (int)a2);
      if (!FigXPCMessageSetBlockBuffer(xdict, (char *)kNeroTransportConnectionEventHandler_BBuf, a3))
        xpc_connection_send_message(v7, xdict);
    }
  }
  if (v9)
  {
    v9[2](v9, a2, a3);
    _Block_release(v9);
  }
  FigXPCRelease(v7);
  FigXPCRelease(xdict);
}

@end
