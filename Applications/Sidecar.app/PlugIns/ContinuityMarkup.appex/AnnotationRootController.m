@implementation AnnotationRootController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  AnnotationRootController *v2;

  v2 = self;
  sub_100005B74();

}

- (void)requestDidStart:(id)a3
{
  id v4;
  AnnotationRootController *v5;

  v4 = a3;
  v5 = self;
  sub_100005E8C(v4);

}

- (void)receivedItems:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  AnnotationRootController *v7;

  v5 = sub_10000543C(0, &qword_10000CC10, SidecarItem_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  sub_100005F08(v6);

  swift_bridgeObjectRelease(v6);
}

- (int64_t)requestCompleted
{
  return 2;
}

- (AnnotationRootController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (AnnotationRootController *)sub_100005F98(v5, v7, a4);
}

- (AnnotationRootController)initWithCoder:(id)a3
{
  return (AnnotationRootController *)sub_1000060E0(a3);
}

- (void).cxx_destruct
{

}

@end
