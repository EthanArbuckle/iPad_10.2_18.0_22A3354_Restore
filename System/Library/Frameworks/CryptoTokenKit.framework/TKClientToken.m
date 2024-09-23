@implementation TKClientToken

- (TKClientToken)initWithTokenID:(id)a3 serverEndpoint:(id)a4 targetUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  __objc2_class **v12;
  TKClientToken *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = +[TKSEPClientToken handlesTokenID:](TKSEPClientToken, "handlesTokenID:", v10);
  v12 = off_1E7088270;
  if (v11)
    v12 = off_1E7088280;
  v13 = (TKClientToken *)objc_msgSend(objc_alloc(*v12), "initWithTokenID:serverEndpoint:targetUID:", v10, v9, v8);

  return v13;
}

- (id)_initWithTokenID:(id)a3
{
  id v5;
  TKClientToken *v6;
  TKClientToken *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKClientToken;
  v6 = -[TKClientToken init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tokenID, a3);

  return v7;
}

- (TKClientToken)initWithTokenID:(id)a3
{
  return -[TKClientToken initWithTokenID:serverEndpoint:targetUID:](self, "initWithTokenID:serverEndpoint:targetUID:", a3, 0, 0);
}

- (id)sessionWithLAContext:(id)a3 error:(id *)a4
{
  id v6;
  TKClientTokenSession *v7;
  TKClientTokenSession *v8;

  v6 = a3;
  v7 = [TKClientTokenSession alloc];
  v8 = -[TKClientTokenSession initWithToken:LAContext:parameters:error:](v7, "initWithToken:LAContext:parameters:error:", self, v6, MEMORY[0x1E0C9AA70], a4);

  return v8;
}

+ (NSArray)builtinTokenIDs
{
  void *v2;
  void *v3;
  void *v4;

  +[TKSEPClientToken builtinTokenIDs](TKSEPClientToken, "builtinTokenIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TKExtensionClientToken builtinTokenIDs](TKExtensionClientToken, "builtinTokenIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSString)tokenID
{
  return self->_tokenID;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (NSXPCListenerEndpoint)configurationEndpoint
{
  return self->_configurationEndpoint;
}

- (NSXPCListenerEndpoint)watcherEndpoint
{
  return self->_watcherEndpoint;
}

- (NSXPCListenerEndpoint)SEPKeyEndpoint
{
  return self->_SEPKeyEndpoint;
}

- (BOOL)_testing_noAutomaticReconnect
{
  return self->__testing_noAutomaticReconnect;
}

- (void)set_testing_noAutomaticReconnect:(BOOL)a3
{
  self->__testing_noAutomaticReconnect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SEPKeyEndpoint, 0);
  objc_storeStrong((id *)&self->_watcherEndpoint, 0);
  objc_storeStrong((id *)&self->_configurationEndpoint, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_tokenID, 0);
}

@end
