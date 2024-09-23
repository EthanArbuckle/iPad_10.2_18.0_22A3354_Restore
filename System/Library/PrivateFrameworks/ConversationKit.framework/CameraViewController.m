@implementation CameraViewController

- (void)effectBrowserViewController:(id)a3 didSelectAppWithIdentifier:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  _TtC15ConversationKit20CameraViewController *v10;

  if (a4)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a3;
  v10 = self;
  CameraViewController.effectBrowserViewController(_:didSelectAppWith:)((uint64_t)v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)effectBrowserViewController:(id)a3 didSelectEffect:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit20CameraViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CameraViewController.effectBrowserViewController(_:didSelect:)((uint64_t)v6, (uint64_t)v7);

}

- (_TtC15ConversationKit20CameraViewController)initWithCaptureMode:(int64_t)a3 devicePosition:(int64_t)a4 flashMode:(int64_t)a5 aspectRatioCrop:(int64_t)a6
{
  return (_TtC15ConversationKit20CameraViewController *)CameraViewController.init(captureMode:devicePosition:flashMode:aspectRatioCrop:)();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit20CameraViewController_cameraDelegate);
}

@end
