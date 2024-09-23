@implementation UIViewController

- (void)perormTapActionWithRecognizer:(id)a3 targetString:(id)a4 inLabel:(id)a5 action:(id)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  UIViewController *v16;

  v10 = _Block_copy(a6);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  _Block_copy(v10);
  v14 = a3;
  v15 = a5;
  v16 = self;
  sub_100063E24((uint64_t)v14, v11, v13, v15, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_bridgeObjectRelease(v13);
}

@end
