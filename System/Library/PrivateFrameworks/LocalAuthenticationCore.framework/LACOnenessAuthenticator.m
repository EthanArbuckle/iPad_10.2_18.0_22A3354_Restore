@implementation LACOnenessAuthenticator

- (LACOnenessAuthenticator)initWithClientInfoProvider:(id)a3 replyQueue:(id)a4
{
  id v6;
  id v7;
  LACOnenessAuthenticator *v8;
  LACOnenessAuthenticator *v9;
  LACOnenessAuthenticationProviderSharing *v10;
  LACOnenessAuthenticationProviding *authenticationProvider;
  uint64_t v12;
  LACOnenessAuthenticating *model;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LACOnenessAuthenticator;
  v8 = -[LACOnenessAuthenticator init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_replyQueue, a4);
    v10 = -[LACOnenessAuthenticationProviderSharing initWithReplyQueue:]([LACOnenessAuthenticationProviderSharing alloc], "initWithReplyQueue:", v7);
    authenticationProvider = v9->_authenticationProvider;
    v9->_authenticationProvider = (LACOnenessAuthenticationProviding *)v10;

    -[LACOnenessAuthenticator makeModelWithClientInfoProvider:](v9, "makeModelWithClientInfoProvider:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    model = v9->_model;
    v9->_model = (LACOnenessAuthenticating *)v12;

  }
  return v9;
}

- (id)authenticationProvider
{
  return self->_authenticationProvider;
}

- (id)model
{
  return self->_model;
}

- (id)replyQueue
{
  return self->_replyQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_authenticationProvider, 0);
}

- (BOOL)isAvailable
{
  LACOnenessAuthenticator *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = objc_msgSend(-[LACOnenessAuthenticator model](v2, sel_model), sel_isAvailable);

  swift_unknownObjectRelease();
  return v3;
}

- (void)domainStateForRequest:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  LACOnenessAuthenticator *v8;
  id v9;
  void *v10;
  _QWORD v11[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  swift_unknownObjectRetain();
  v8 = self;
  v9 = -[LACOnenessAuthenticator model](v8, sel_model);
  v11[4] = thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary?, @unowned NSError?) -> ()partial apply;
  v11[5] = v7;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed (@guaranteed [AnyHashable : Any]?, @guaranteed Error?) -> ();
  v11[3] = &block_descriptor_13;
  v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_domainStateForRequest_completion_, a3, v10);
  _Block_release(v10);
  swift_unknownObjectRelease();

  swift_release();
  swift_unknownObjectRelease();
}

- (void)authenticateRequest:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  LACOnenessAuthenticator *v8;
  id v9;
  void *v10;
  _QWORD v11[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  swift_unknownObjectRetain();
  v8 = self;
  v9 = -[LACOnenessAuthenticator model](v8, sel_model);
  v11[4] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary?, @unowned NSError?) -> ();
  v11[5] = v7;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed (@guaranteed [AnyHashable : Any]?, @guaranteed Error?) -> ();
  v11[3] = &block_descriptor_6;
  v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_authenticateRequest_completion_, a3, v10);
  _Block_release(v10);
  swift_unknownObjectRelease();

  swift_release();
  swift_unknownObjectRelease();
}

- (void)cancelAuthenticationForRequest:(id)a3
{
  LACOnenessAuthenticator *v5;

  swift_unknownObjectRetain();
  v5 = self;
  objc_msgSend(-[LACOnenessAuthenticator model](v5, sel_model), sel_cancelAuthenticationForRequest_, a3);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (id)makeModelWithClientInfoProvider:(id)a3
{
  LACOnenessAuthenticator *v5;
  id v6;
  id v7;
  id v8;
  char *v9;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = -[LACOnenessAuthenticator authenticationProvider](v5, sel_authenticationProvider);
  swift_unknownObjectRetain();
  v7 = -[LACOnenessAuthenticator replyQueue](v5, sel_replyQueue);
  v8 = objc_allocWithZone((Class)type metadata accessor for LACOnenessAuthenticatorModel());
  v9 = LACOnenessAuthenticatorModel.init(authenticationProvider:clientInfoProvider:replyQueue:)((uint64_t)v6, (uint64_t)a3, v7);
  swift_unknownObjectRelease();

  return v9;
}

@end
