@implementation MRMediaRemoteServiceGroupDevicesAndSendCommand

void __MRMediaRemoteServiceGroupDevicesAndSendCommand_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  MRCreateCommandResultFromXPCMessage(v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendError");
  v4 = (void *)MRCreatePropertyListFromXPCMessage(v3, "MRXPC_ROUTE_UID_KEY");
  _MRServiceCreateGenericErrorFromReply(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "resultStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  kdebug_trace();

}

@end
