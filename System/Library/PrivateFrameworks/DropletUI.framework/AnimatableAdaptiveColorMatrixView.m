@implementation AnimatableAdaptiveColorMatrixView

+ (Class)layerClass
{
  sub_23A81A1DC(0, &qword_2542D7FD8);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC9DropletUI33AnimatableAdaptiveColorMatrixView)initWithFrame:(CGRect)a3
{
  return (_TtC9DropletUI33AnimatableAdaptiveColorMatrixView *)sub_23A83DC50(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9DropletUI33AnimatableAdaptiveColorMatrixView)initWithCoder:(id)a3
{
  _OWORD *v4;
  id v5;
  _TtC9DropletUI33AnimatableAdaptiveColorMatrixView *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC9DropletUI33AnimatableAdaptiveColorMatrixView_inputColorMatrix);
  *v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  v4[4] = 0u;
  v5 = a3;

  result = (_TtC9DropletUI33AnimatableAdaptiveColorMatrixView *)sub_23A84C39C();
  __break(1u);
  return result;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC9DropletUI33AnimatableAdaptiveColorMatrixView *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  objc_super v13;

  if (a3)
  {
    v4 = sub_23A84C21C();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = qword_2569C25D8;
  v8 = self;
  if (v7 == -1)
  {
    if (v6)
      goto LABEL_6;
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  swift_once();
  if (!v6)
    goto LABEL_14;
LABEL_6:
  v9 = v4 == qword_2569C3BF8 && v6 == unk_2569C3C00;
  if (!v9 && (sub_23A84C3FC() & 1) == 0)
  {
    v11 = (void *)sub_23A84C210();
LABEL_15:
    v13.receiver = v8;
    v13.super_class = (Class)type metadata accessor for AnimatableAdaptiveColorMatrixView();
    v10 = -[AnimatableAdaptiveColorMatrixView _shouldAnimatePropertyWithKey:](&v13, sel__shouldAnimatePropertyWithKey_, v11);

    swift_bridgeObjectRelease();
    return v10;
  }

  swift_bridgeObjectRelease();
  return 1;
}

@end
