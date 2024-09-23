@implementation RemoteViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  id v8;
  RemoteViewController *v9;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10001CC60, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_100006118;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_100003B24(a3, v6);
  sub_1000060E4((uint64_t)v6, v7);

}

- (void)didInvalidateForRemoteAlert
{
  RemoteViewController *v3;
  uint64_t v4;
  id v5;

  sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
  v3 = self;
  v5 = (id)static OS_os_log.default.getter(v3);
  v4 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("didInvalidateForRemoteAlert", 27, 2, &_mh_execute_header, v5, v4, &_swiftEmptyArrayStorage);

}

- (void)viewDidAppear:(BOOL)a3
{
  RemoteViewController *v4;

  v4 = self;
  sub_100004334(a3);

}

- (void)proxCardFlowWillPresent
{
  void *v2;
  void *v3;
  RemoteViewController *v4;

  v4 = self;
  v2 = (void *)sub_100003A6C();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "setStatusBarHidden:withDuration:", 1, 0.0);

    swift_unknownObjectRelease(v3);
  }
  else
  {

  }
}

- (void)proxCardFlowDidDismiss
{
  RemoteViewController *v2;

  v2 = self;
  sub_10000483C();

}

- (void)_setupComplete
{
  RemoteViewController *v2;

  v2 = self;
  sub_100004BC8();

}

- (void)_setupCancelled:(id)a3
{
  id v4;
  RemoteViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100004C80(v4);

}

- (void)_setupFailed
{
  RemoteViewController *v2;

  v2 = self;
  sub_100004FF4();

}

- (void)_passwordRequested:(id)a3
{
  id v4;
  RemoteViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100005034(v4);

}

- (void)_passwordPresented:(id)a3
{
  id v4;
  RemoteViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000053EC(v4);

}

- (void)_passwordAccepted
{
  RemoteViewController *v2;

  v2 = self;
  sub_1000059B0();

}

- (RemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (RemoteViewController *)sub_100005A68(v5, v7, a4);
}

- (RemoteViewController)initWithCoder:(id)a3
{
  return (RemoteViewController *)sub_100005BD8(a3);
}

- (void).cxx_destruct
{

}

@end
