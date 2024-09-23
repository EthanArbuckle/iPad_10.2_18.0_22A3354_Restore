@implementation MRMediaRemoteServiceGetHostedRoutingXPCEndpoint

void __MRMediaRemoteServiceGetHostedRoutingXPCEndpoint_block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  void *v6;
  int64_t uint64;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0C81258];
  v5 = a2;
  v6 = v5;
  if (a2 == v4 || a2 == (void *)MEMORY[0x1E0C81260])
  {
    _MRServiceLogReplyError();

    v10 = 0;
    uint64 = 1;
  }
  else
  {
    xpc_dictionary_get_value(v5, "MRXPC_CUSTOM_XPC_ENDPOINT_KEY");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_ERROR_CODE_KEY");

    if (uint64 <= 0)
    {
      v9 = 0;
      goto LABEL_10;
    }
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", uint64);
LABEL_10:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
