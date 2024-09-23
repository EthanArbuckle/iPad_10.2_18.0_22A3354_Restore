@implementation MRBannerCenter

+ (void)dismissAllBannerRequests
{
  void *v2;
  void *v3;
  _xpc_connection_s *v4;
  void *v5;
  NSObject *v6;
  id v7;

  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  MRCreateXPCMessage(0x30000000000002EuLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connection");
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workerQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message_with_reply(v4, v3, v6, &__block_literal_global_8);

}

@end
