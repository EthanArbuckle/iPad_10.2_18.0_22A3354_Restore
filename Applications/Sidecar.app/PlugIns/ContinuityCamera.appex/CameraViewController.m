@implementation CameraViewController

- (BOOL)shouldAutorotate
{
  _TtC16ContinuityCamera20CameraViewController *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1000080D8();

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  _TtC16ContinuityCamera20CameraViewController *v2;

  v2 = self;
  sub_100008138();

}

- (void)didReceiveMemoryWarning
{
  _TtC16ContinuityCamera20CameraViewController *v2;

  v2 = self;
  sub_1000087E8(type metadata accessor for CameraViewController, (SEL *)&selRef_didReceiveMemoryWarning);

}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC16ContinuityCamera20CameraViewController *v11;

  type metadata accessor for InfoKey(0);
  v8 = v7;
  sub_100008D94();
  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  v10 = a3;
  v11 = self;
  sub_1000082F8((uint64_t)v11, v9);

  swift_bridgeObjectRelease(v9);
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4;
  _TtC16ContinuityCamera20CameraViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100008540();

}

- (_TtC16ContinuityCamera20CameraViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16ContinuityCamera20CameraViewController *)sub_1000085DC(v5, v7, a4);
}

- (_TtC16ContinuityCamera20CameraViewController)initWithCoder:(id)a3
{
  return (_TtC16ContinuityCamera20CameraViewController *)sub_100008710(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_cameraPicker));
  sub_100008DD4((uint64_t)self + OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_delegate);
}

@end
