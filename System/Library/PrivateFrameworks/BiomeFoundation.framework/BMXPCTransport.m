@implementation BMXPCTransport

void __31___BMXPCTransport__handleEvent__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  void *v5;
  uint64_t v6;
  xpc_object_t reply;
  xpc_object_t xdict;

  xdict = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  if (MEMORY[0x1AF456F50](xdict) == MEMORY[0x1E0C81310])
  {
    objc_msgSend(*(id *)(a1 + 32), "errorHandler");
    v6 = objc_claimAutoreleasedReturnValue();
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
    if (v6)
      (*(void (**)(uint64_t, xpc_object_t))(v6 + 16))(v6, xdict);
    if (xdict == (xpc_object_t)MEMORY[0x1E0C81260])
    {
      objc_msgSend(*(id *)(a1 + 32), "setErrorHandler:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setMessageHandler:", 0);
    }
    goto LABEL_12;
  }
  if (MEMORY[0x1AF456F50](xdict) == MEMORY[0x1E0C812F8])
  {
    objc_msgSend(*(id *)(a1 + 32), "messageHandler");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      xpc_dictionary_get_dictionary(xdict, "bm_info");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
        objc_msgSend(*(id *)(a1 + 32), "setRemoteUserInfo:", v5);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "setRemoteUserInfo:", MEMORY[0x1E0C9AA70]);
      }
      reply = xpc_dictionary_create_reply(xdict);
      ((void (**)(_QWORD, xpc_object_t, xpc_object_t))v3)[2](v3, xdict, reply);

    }
LABEL_12:

  }
}

@end
