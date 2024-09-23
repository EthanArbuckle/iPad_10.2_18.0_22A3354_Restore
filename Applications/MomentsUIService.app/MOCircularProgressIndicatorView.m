@implementation MOCircularProgressIndicatorView

- (void)layoutSubviews
{
  _TtC16MomentsUIService31MOCircularProgressIndicatorView *v2;

  v2 = self;
  MOCircularProgressIndicatorView.layoutSubviews()();

}

- (void)touchPlayback:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC16MomentsUIService31MOCircularProgressIndicatorView *v6;
  uint64_t v7;
  void (*v8)(_QWORD *);
  _TtC16MomentsUIService31MOCircularProgressIndicatorView *v9;
  _QWORD v10[5];

  v4 = one-time initialization token for shared;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once(&one-time initialization token for shared, one-time initialization function for shared);
  v7 = static MOMusicPlaybackCoordinator.shared;
  v10[3] = type metadata accessor for MOCircularProgressIndicatorView();
  v10[4] = &protocol witness table for MOCircularProgressIndicatorView;
  v10[0] = v6;
  v8 = *(void (**)(_QWORD *))(*(_QWORD *)v7 + 360);
  v9 = v6;
  v8(v10);
  __swift_destroy_boxed_opaque_existential_1(v10);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC16MomentsUIService31MOCircularProgressIndicatorView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = MOCircularProgressIndicatorView.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (_TtC16MomentsUIService31MOCircularProgressIndicatorView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOCircularProgressIndicatorView.init(coder:)();
}

- (_TtC16MomentsUIService31MOCircularProgressIndicatorView)initWithFrame:(CGRect)a3
{
  _TtC16MomentsUIService31MOCircularProgressIndicatorView *result;

  result = (_TtC16MomentsUIService31MOCircularProgressIndicatorView *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOCircularProgressIndicatorView", 48, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOCircularProgressIndicatorView_borderLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOCircularProgressIndicatorView_progressLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOCircularProgressIndicatorView_playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOCircularProgressIndicatorView_config));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOCircularProgressIndicatorView_playButtonConfig));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOCircularProgressIndicatorView_blurMaterialView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->borderLayer[OBJC_IVAR____TtC16MomentsUIService31MOCircularProgressIndicatorView_mediaAssetID]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOCircularProgressIndicatorView_borderPath));
}

@end
