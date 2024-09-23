@implementation DropletEffectView

- (_TtC9DropletUI17DropletEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC9DropletUI17DropletEffectView *)sub_23A82ECEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9DropletUI17DropletEffectView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23A82F954();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC9DropletUI17DropletEffectView *v8;
  _TtC9DropletUI17DropletEffectView *v9;
  unsigned __int8 v10;
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
  v7 = qword_2569C2598;
  v8 = self;
  v9 = v8;
  if (v7 != -1)
  {
    LOBYTE(v8) = swift_once();
    if (v6)
      goto LABEL_6;
LABEL_11:
    __break(1u);
    return (char)v8;
  }
  if (!v6)
    goto LABEL_11;
LABEL_6:
  if ((sub_23A83E2BC(v4, v6, (_QWORD *)qword_2569C3BB0) & 1) != 0)
  {

    swift_bridgeObjectRelease();
    v10 = 1;
  }
  else
  {
    v11 = (void *)sub_23A84C210();
    v13.receiver = v9;
    v13.super_class = (Class)type metadata accessor for DropletEffectView();
    v10 = -[BlurredView _shouldAnimatePropertyWithKey:](&v13, sel__shouldAnimatePropertyWithKey_, v11);

    swift_bridgeObjectRelease();
  }
  LOBYTE(v8) = v10;
  return (char)v8;
}

- (void)layoutSubviews
{
  _TtC9DropletUI17DropletEffectView *v2;

  v2 = self;
  sub_23A82F118();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI17DropletEffectView_alphaThresholdInputColor));
}

@end
