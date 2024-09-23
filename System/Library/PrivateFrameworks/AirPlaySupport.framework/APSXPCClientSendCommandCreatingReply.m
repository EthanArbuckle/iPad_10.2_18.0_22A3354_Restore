@implementation APSXPCClientSendCommandCreatingReply

uint64_t __APSXPCClientSendCommandCreatingReply_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _xpc_connection_s *mach_service;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  xpc_object_t v11;
  int int64;
  uint64_t v13;
  void *v14;
  uint64_t result;
  _QWORD handler[5];
  char *name;

  v2 = a1[5];
  v3 = a1[7];
  v4 = a1[8];
  name = 0;
  if (!*(_QWORD *)(v2 + 32))
  {
    v5 = CFStringCopyUTF8CString();
    v6 = v5;
    if ((_DWORD)v5)
    {
      APSLogErrorAt(v5);
    }
    else
    {
      mach_service = xpc_connection_create_mach_service(name, *(dispatch_queue_t *)(v2 + 24), 0);
      v8 = MEMORY[0x1E0C809B0];
      *(_QWORD *)(v2 + 32) = mach_service;
      handler[0] = v8;
      handler[1] = 0x40000000;
      handler[2] = __apsxpc_clientEnsureConnection_block_invoke;
      handler[3] = &__block_descriptor_tmp_47_1851;
      handler[4] = v2;
      xpc_connection_set_event_handler(mach_service, handler);
      xpc_connection_resume(*(xpc_connection_t *)(v2 + 32));
    }
    if (name)
      free(name);
    if ((_DWORD)v6)
    {
      APSLogErrorAt(v6);
      goto LABEL_23;
    }
  }
  v9 = xpc_dictionary_create(0, 0, 0);
  v10 = FigXPCMessageSetCFString();
  if ((_DWORD)v10)
  {
    LODWORD(v6) = v10;
LABEL_27:
    APSLogErrorAt(v10);
    goto LABEL_23;
  }
  if (v3)
  {
    v10 = FigXPCMessageSetCFDictionary();
    if ((_DWORD)v10)
    {
      LODWORD(v6) = v10;
      goto LABEL_27;
    }
  }
  v11 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(v2 + 32), v9);
  if (MEMORY[0x1CAA43374]() != MEMORY[0x1E0C812F8])
  {
    if (gLogCategory_APSXPCService <= 50
      && (gLogCategory_APSXPCService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    xpc_connection_cancel(*(xpc_connection_t *)(v2 + 32));
    v14 = *(void **)(v2 + 32);
    if (v14)
    {
      *(_QWORD *)(v2 + 32) = 0;
      xpc_release(v14);
    }
    LODWORD(v6) = -6753;
    v13 = 4294960543;
    goto LABEL_22;
  }
  int64 = xpc_dictionary_get_int64(v11, "OutError");
  LODWORD(v6) = int64;
  if (v4)
  {
    if (!int64)
    {
      v13 = FigXPCMessageCopyCFDictionary();
      LODWORD(v6) = v13;
      if ((_DWORD)v13)
LABEL_22:
        APSLogErrorAt(v13);
    }
  }
LABEL_23:
  FigXPCRelease();
  result = FigXPCRelease();
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v6;
  return result;
}

@end
