@implementation CameraControlsView

- (CGSize)intrinsicContentSize
{
  uint64_t v2;
  _TtC11AssetViewer18CameraControlsView *v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = qword_1F01C2E48;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = *(double *)&qword_1F01CF2B8;
  v5 = qword_1F01CF2B8;
  if (qword_1F01C2E50 != -1)
  {
    swift_once();
    v5 = qword_1F01CF2B8;
  }
  v6 = *(double *)&qword_1F01CF2C0;

  v7 = v4 + v6;
  v8 = *(double *)&v5;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC11AssetViewer18CameraControlsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D93E9730();
}

- (void)buttonPressedWithSender:(id)a3
{
  id v4;
  _TtC11AssetViewer18CameraControlsView *v5;

  v4 = a3;
  v5 = self;
  sub_1D93E6CBC();

}

- (_TtC11AssetViewer18CameraControlsView)initWithFrame:(CGRect)a3
{
  _TtC11AssetViewer18CameraControlsView *result;

  result = (_TtC11AssetViewer18CameraControlsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer18CameraControlsView_entityController));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer18CameraControlsView_rightButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer18CameraControlsView_downButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer18CameraControlsView_leftButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer18CameraControlsView_fastMovementButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer18CameraControlsView_zoomOutButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer18CameraControlsView_zoomInButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer18CameraControlsView_menuButton));
}

@end
