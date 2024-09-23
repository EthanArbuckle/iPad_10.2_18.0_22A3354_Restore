@implementation MRMediaRemoteServiceGetAppsSupportingBrowsableContentAPIs

void __MRMediaRemoteServiceGetAppsSupportingBrowsableContentAPIs_block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  void *v6;
  void *Error;
  id v9;

  v4 = (void *)MEMORY[0x1E0C81258];
  v5 = a2;
  v6 = v5;
  if (a2 == v4 || a2 == (void *)MEMORY[0x1E0C81260])
  {
    _MRServiceLogReplyError();

    Error = (void *)MRMediaRemoteCreateError(1);
    v9 = 0;
  }
  else
  {
    _MRServiceCreateGenericErrorFromReply(v5);
    Error = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)MRCreatePropertyListFromXPCMessage(v6, "MRXPC_BUNDLE_ID_ARRAY_DATA_KEY");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  kdebug_trace();

}

@end
