@implementation FigXPCRemoteClientCreateSecondaryConnection

xpc_connection_t __FigXPCRemoteClientCreateSecondaryConnection_block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  _xpc_endpoint_s *value;
  _xpc_endpoint_s *v5;
  xpc_connection_t v6;
  xpc_object_t xdict;
  void *v9;

  xdict = 0;
  v9 = 0;
  v2 = FigXPCCreateBasicMessage(0x2E326E64u, 0, &v9);
  v3 = v9;
  if (v2 || FigXPCRemoteClientSendSyncMessageCreatingReply(*(_QWORD *)(a1 + 32), (uint64_t)v9, &xdict))
    goto LABEL_8;
  value = (_xpc_endpoint_s *)xpc_dictionary_get_value(xdict, ".SecondaryEndpoint");
  if (!value
    || (v5 = value, MEMORY[0x193FFCDCC]() != MEMORY[0x1E0C81308])
    || (v6 = xpc_connection_create_from_endpoint(v5)) == 0)
  {
    FigSignalErrorAt(4294951137, 0, 0, 0, 0, 0, 0);
LABEL_8:
    v6 = 0;
  }
  FigXPCRelease(v3);
  FigXPCRelease(xdict);
  return v6;
}

@end
