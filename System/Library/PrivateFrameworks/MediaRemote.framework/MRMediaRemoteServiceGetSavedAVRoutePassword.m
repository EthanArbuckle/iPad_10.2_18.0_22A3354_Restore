@implementation MRMediaRemoteServiceGetSavedAVRoutePassword

void __MRMediaRemoteServiceGetSavedAVRoutePassword_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  const char *string;
  uint64_t v5;
  id v6;

  if (xdict == (xpc_object_t)MEMORY[0x1E0C81258] || xdict == (xpc_object_t)MEMORY[0x1E0C81260])
  {
    _MRServiceLogReplyError();
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  string = xpc_dictionary_get_string(xdict, "MRXPC_ROUTE_PASSWORD_KEY");
  if (!string)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v6 = (id)v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  kdebug_trace();

}

@end
