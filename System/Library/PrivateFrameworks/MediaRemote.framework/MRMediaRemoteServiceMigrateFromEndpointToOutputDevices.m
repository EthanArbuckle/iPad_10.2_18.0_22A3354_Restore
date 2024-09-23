@implementation MRMediaRemoteServiceMigrateFromEndpointToOutputDevices

id __MRMediaRemoteServiceMigrateFromEndpointToOutputDevices_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __MRMediaRemoteServiceMigrateFromEndpointToOutputDevices_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  void *Error;
  MRPlaybackSessionMigrateRequest *v6;
  UInt8 *v7;
  MRPlaybackSessionMigrateRequest *v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v4 = v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260];
  v10 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    Error = (void *)MRMediaRemoteCreateError(1);
  }
  else
  {
    Error = (void *)MRCreateClientErrorFromXPCMessage(v3);
    v6 = [MRPlaybackSessionMigrateRequest alloc];
    v7 = (UInt8 *)MRCreateDataFromXPCMessage(v10, "MRXPC_MIGRATE_REQUEST_DATA_KEY");
    v8 = -[MRPlaybackSessionMigrateRequest initWithData:](v6, "initWithData:", v7);

    objc_msgSend(*(id *)(a1 + 32), "merge:", v8);
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, Error);
  kdebug_trace();

}

@end
