@implementation GradientView

- (_TtC22SubscribePageExtension12GradientView)init
{
  return (_TtC22SubscribePageExtension12GradientView *)sub_10003B128();
}

- (_TtC22SubscribePageExtension12GradientView)initWithCoder:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension12GradientView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension12GradientView_colors) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension12GradientView_kind) = 0;
  v4 = a3;

  result = (_TtC22SubscribePageExtension12GradientView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/GradientView.swift", 41, 2, 47, 0);
  __break(1u);
  return result;
}

+ (Class)layerClass
{
  uint64_t v2;

  v2 = sub_100019574(0, &qword_1007F5228, CAGradientLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC22SubscribePageExtension12GradientView)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension12GradientView *result;

  result = (_TtC22SubscribePageExtension12GradientView *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.GradientView", 35, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension12GradientView_colors));
}

@end
