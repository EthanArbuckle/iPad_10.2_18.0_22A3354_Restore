@implementation AuthorizationRemoteViewController

+ (id)_exportedInterface
{
  return sub_100038020((uint64_t)a1, (uint64_t)a2, &protocolRef_LACUIAuthenticatorService);
}

- (BOOL)_shouldForwardSystemLayoutFittingSizeChanges
{
  return 1;
}

+ (id)_remoteViewControllerInterface
{
  return sub_100038020((uint64_t)a1, (uint64_t)a2, &protocolRef_LACUIAuthenticatorHost);
}

- (AuthorizationRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (AuthorizationRemoteViewController *)AuthorizationRemoteViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (AuthorizationRemoteViewController)initWithCoder:(id)a3
{
  return (AuthorizationRemoteViewController *)AuthorizationRemoteViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___AuthorizationRemoteViewController_terminateAssertion));
  v3 = (char *)self + OBJC_IVAR___AuthorizationRemoteViewController_log;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)startWithConfiguration:(id)a3 reply:(id)a4
{
  void (**v6)(void *, void *);
  AuthorizationRemoteViewController *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v6 = (void (**)(void *, void *))_Block_copy(a4);
  v11 = a3;
  v7 = self;
  v8 = objc_msgSend(v11, "validateConfiguration");
  if (v8)
  {
    v9 = v8;
    v10 = (void *)_convertErrorToNSError(_:)(v9);
    v6[2](v6, v10);

  }
  else
  {
    AuthorizationRemoteViewController.presentUI(configuration:)(v11);
    v6[2](v6, 0);
  }
  _Block_release(v6);

}

- (void)stopWithReply:(id)a3
{
  void *v4;
  AuthorizationRemoteViewController *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100038CC8((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)viewModel:(id)a3 didReceiveCustomPassword:(id)a4 handler:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  AuthorizationRemoteViewController *v14;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = swift_allocObject(&unk_10007B398, 24, 7);
  *(_QWORD *)(v12 + 16) = v8;
  v13 = a3;
  v14 = self;
  sub_100038D70(v9, v11, (uint64_t)sub_10002BFB8, v12);

  swift_bridgeObjectRelease(v11);
  swift_release(v12);
}

@end
