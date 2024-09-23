@implementation AUDistortionControlsView

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AUDistortionControlsView();
  return -[AUDistortionControlsView tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AUDistortionControlsView();
  -[AUDistortionControlsView setTintColor:](&v4, sel_setTintColor_, a3);
}

- (_TtC12CoreAudioKit24AUDistortionControlsView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit24AUDistortionControlsView *)sub_21317C628(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit24AUDistortionControlsView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit24AUDistortionControlsView *)sub_21317C7E0(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit24AUDistortionControlsView_titleLabel));
  sub_21317BC98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit24AUDistortionControlsView_owner, &qword_254B88228);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit24AUDistortionControlsView_audioUnit));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit24AUDistortionControlsView_dataSource));
  sub_21317BC98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit24AUDistortionControlsView_genericCellRegistration, (uint64_t *)&unk_254B886B0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit24AUDistortionControlsView_collectionView));
}

@end
