@implementation MRMediaRemoteServiceCreateHostedEndpointForDevices

void __MRMediaRemoteServiceCreateHostedEndpointForDevices_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = (id)MRCreateEndpointFromXPCMessage(v3);
  _MRServiceCreateGenericErrorFromReply(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
