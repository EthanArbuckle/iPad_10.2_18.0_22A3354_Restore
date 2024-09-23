@implementation EqualizerView

- (_TtC13MediaControls13EqualizerView)init
{
  uint64_t ObjectType;
  _TtC13MediaControls13EqualizerView *v3;

  ObjectType = swift_getObjectType();
  v3 = (_TtC13MediaControls13EqualizerView *)(*(uint64_t (**)(uint64_t, double, double))(ObjectType + 288))(6, 1.2, 0.5);
  swift_deallocPartialClassInstance();
  return v3;
}

- (void)layoutSubviews
{
  _QWORD *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for EqualizerView();
  v2 = v4.receiver;
  v3 = -[EqualizerView layoutSubviews](&v4, sel_layoutSubviews);
  if (((*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xD0))(v3) & 1) != 0)
    sub_1AAA972D8();

}

- (_TtC13MediaControls13EqualizerView)initWithCoder:(id)a3
{
  id v4;
  _TtC13MediaControls13EqualizerView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls13EqualizerView_isAnimating) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls13EqualizerView_hidesWhenStopped) = 1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls13EqualizerView_barViews) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls13EqualizerView_stylingProvider) = 0;
  v4 = a3;

  result = (_TtC13MediaControls13EqualizerView *)sub_1AAABA7FC();
  __break(1u);
  return result;
}

- (_TtC13MediaControls13EqualizerView)initWithFrame:(CGRect)a3
{
  _TtC13MediaControls13EqualizerView *result;

  result = (_TtC13MediaControls13EqualizerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls13EqualizerView_stylingProvider));
}

@end
