@implementation SignatureViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 24;
}

- (void)viewDidLoad
{
  SignatureViewController *v2;

  v2 = self;
  sub_100004F64();

}

- (void)_cancelWithSender:(id)a3
{
  sub_100006120(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_100005A5C);
}

- (void)_clearWithSender:(id)a3
{
  sub_100006120(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_100005A7C);
}

- (void)receivedItems:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  SignatureViewController *v7;

  v5 = sub_100006FCC((uint64_t)self, &qword_10000C7B0, SidecarItem_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  sub_100005AA0(v6);

  swift_bridgeObjectRelease(v6);
}

- (void)_doneWithSender:(id)a3
{
  sub_100006120(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_100005F78);
}

- (SignatureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (SignatureViewController *)sub_10000618C(v5, v7, a4);
}

- (SignatureViewController)initWithCoder:(id)a3
{
  return (SignatureViewController *)sub_100006368(a3);
}

- (void).cxx_destruct
{

}

- (void)signatureViewSignatureUpdated:(id)a3
{
  id v4;
  SignatureViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100006578();

  sub_100006FA4(v5);
}

@end
