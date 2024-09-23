@implementation CALNDataAccessExpressSharedConnection

+ (id)sharedConnection
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__CALNDataAccessExpressSharedConnection_sharedConnection__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, block);
  return (id)sharedConnection_sharedConnection;
}

void __57__CALNDataAccessExpressSharedConnection_sharedConnection__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedConnection_sharedConnection;
  sharedConnection_sharedConnection = v0;

}

- (void)respondToSharedCalendarInvite:(int64_t)a3 forCalendarWithID:(id)a4 accountID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v11 = (void *)MEMORY[0x24BE2ACF0];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  objc_msgSend(v11, "sharedConnection");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "respondToSharedCalendarInvite:forCalendarWithID:accountID:queue:completionBlock:", a3, v15, v14, v13, v12);

}

- (void)reportSharedCalendarInviteAsJunkForCalendarWithID:(id)a3 accountID:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v9 = (void *)MEMORY[0x24BE2ACF0];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v9, "sharedConnection");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reportSharedCalendarInviteAsJunkForCalendarWithID:accountID:queue:completionBlock:", v13, v12, v11, v10);

}

@end
