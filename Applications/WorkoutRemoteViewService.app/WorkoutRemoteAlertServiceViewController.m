@implementation WorkoutRemoteAlertServiceViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(uint64_t);
  uint64_t v7;
  id v8;
  WorkoutRemoteAlertServiceViewController *v9;

  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100008728, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(uint64_t))sub_100004060;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_100002228(a3, v6);
  sub_10000402C((uint64_t)v6, v7);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(const void *);
  void (**v7)(const void *);
  void (*v8)(const void *);
  id v9;
  WorkoutRemoteAlertServiceViewController *v10;

  v6 = (void (**)(const void *))_Block_copy(a4);
  if (v6)
  {
    v7 = v6;
    v8 = v6[2];
    v9 = a3;
    v10 = self;
    v8(v7);
    _Block_release(v7);

  }
}

- (void)dismissView
{
  WorkoutRemoteAlertServiceViewController *v2;

  v2 = self;
  sub_100002EFC();

}

- (WorkoutRemoteAlertServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  WorkoutRemoteAlertServiceViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for WorkoutRemoteAlertServiceViewController();
  v11 = -[WorkoutRemoteAlertServiceViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (WorkoutRemoteAlertServiceViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutRemoteAlertServiceViewController();
  return -[WorkoutRemoteAlertServiceViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
