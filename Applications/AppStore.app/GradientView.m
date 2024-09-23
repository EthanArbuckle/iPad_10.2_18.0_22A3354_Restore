@implementation GradientView

+ (Class)layerClass
{
  uint64_t v2;

  v2 = sub_100008FE4(0, &qword_1008335F8, CAGradientLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC8AppStore12GradientView)init
{
  return (_TtC8AppStore12GradientView *)sub_100053BB0();
}

- (_TtC8AppStore12GradientView)initWithCoder:(id)a3
{
  id v4;
  _TtC8AppStore12GradientView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore12GradientView_colors) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore12GradientView_kind) = 0;
  v4 = a3;

  result = (_TtC8AppStore12GradientView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/GradientView.swift", 27, 2, 47, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore12GradientView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore12GradientView *result;

  result = (_TtC8AppStore12GradientView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.GradientView", 21, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore12GradientView_colors));
}

@end
