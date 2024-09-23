@implementation HandleSetHandlerMessage

void __HandleSetHandlerMessage_block_invoke(uint64_t a1, unsigned int a2, const void *a3)
{
  xpc_object_t xdict;

  xdict = 0;
  if (!FigXPCCreateBasicMessage(0x6F75746Du, *(_QWORD *)(a1 + 32), &xdict))
  {
    xpc_dictionary_set_uint64(xdict, "MessageType", a2);
    if (!a3 || !FigXPCMessageSetCFObject(xdict, "Payload", a3))
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), xdict);
  }
  FigXPCRelease(xdict);
}

@end
