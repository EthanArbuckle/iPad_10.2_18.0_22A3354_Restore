@implementation BlurredView

- (_TtC9DropletUI11BlurredView)initWithFrame:(CGRect)a3
{
  return (_TtC9DropletUI11BlurredView *)sub_23A8149E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9DropletUI11BlurredView)initWithCoder:(id)a3
{
  id v4;
  _TtC9DropletUI11BlurredView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9DropletUI11BlurredView_disableBlurFilterOverride) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9DropletUI11BlurredView_gaussianBlurInputRadius) = 0;
  v4 = a3;

  result = (_TtC9DropletUI11BlurredView *)sub_23A84C39C();
  __break(1u);
  return result;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC9DropletUI11BlurredView *v8;
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
  v7 = qword_2569C2570;
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
  v9 = v4 == qword_2569C3B80 && v6 == *(_QWORD *)algn_2569C3B88;
  if (!v9 && (sub_23A84C3FC() & 1) == 0)
  {
    v11 = (void *)sub_23A84C210();
LABEL_15:
    v13.receiver = v8;
    v13.super_class = (Class)type metadata accessor for BlurredView();
    v10 = -[BlurredView _shouldAnimatePropertyWithKey:](&v13, sel__shouldAnimatePropertyWithKey_, v11);

    swift_bridgeObjectRelease();
    return v10;
  }

  swift_bridgeObjectRelease();
  return 1;
}

@end
