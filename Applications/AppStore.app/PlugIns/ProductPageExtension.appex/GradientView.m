@implementation GradientView

- (_TtC20ProductPageExtension12GradientView)init
{
  return (_TtC20ProductPageExtension12GradientView *)sub_10017ECC0();
}

- (_TtC20ProductPageExtension12GradientView)initWithCoder:(id)a3
{
  id v4;
  _TtC20ProductPageExtension12GradientView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension12GradientView_colors) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension12GradientView_kind) = 0;
  v4 = a3;

  result = (_TtC20ProductPageExtension12GradientView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/GradientView.swift", 39, 2, 47, 0);
  __break(1u);
  return result;
}

+ (Class)layerClass
{
  uint64_t v2;

  v2 = sub_100018B6C(0, &qword_1008125A0, CAGradientLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC20ProductPageExtension12GradientView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension12GradientView *result;

  result = (_TtC20ProductPageExtension12GradientView *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.GradientView", 33, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension12GradientView_colors));
}

@end
