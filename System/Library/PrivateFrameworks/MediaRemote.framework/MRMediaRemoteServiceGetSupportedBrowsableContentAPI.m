@implementation MRMediaRemoteServiceGetSupportedBrowsableContentAPI

void __MRMediaRemoteServiceGetSupportedBrowsableContentAPI_block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  void *v6;
  id Error;

  v4 = (void *)MEMORY[0x1E0C81258];
  v5 = a2;
  v6 = v5;
  if (a2 == v4 || a2 == (void *)MEMORY[0x1E0C81260])
  {
    _MRServiceLogReplyError();

    Error = (id)MRMediaRemoteCreateError(1);
  }
  else
  {
    xpc_dictionary_get_uint64(v5, "MRXPC_CONTENT_API_MASK_KEY");
    Error = (id)MRCreateClientErrorFromXPCMessage(v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  kdebug_trace();

}

@end
