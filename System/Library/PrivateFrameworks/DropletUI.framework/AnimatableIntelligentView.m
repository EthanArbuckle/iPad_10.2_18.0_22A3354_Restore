@implementation AnimatableIntelligentView

- (_TtC9DropletUI25AnimatableIntelligentView)initWithCoder:(id)a3
{
  id v4;
  _TtC9DropletUI25AnimatableIntelligentView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView____lazy_storage___lightView) = 0;
  v4 = a3;

  result = (_TtC9DropletUI25AnimatableIntelligentView *)sub_23A84C39C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AnimatableIntelligentView();
  v2 = v4.receiver;
  -[AnimatableIntelligentView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = sub_23A8498B0();
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC9DropletUI25AnimatableIntelligentView *v8;
  _TtC9DropletUI25AnimatableIntelligentView *v9;
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
  v7 = qword_2569C25E8;
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
  if ((sub_23A83E2BC(v4, v6, (_QWORD *)qword_2569C3148) & 1) != 0)
  {

    swift_bridgeObjectRelease();
    v10 = 1;
  }
  else
  {
    v11 = (void *)sub_23A84C210();
    v13.receiver = v9;
    v13.super_class = (Class)type metadata accessor for AnimatableIntelligentView();
    v10 = -[AnimatableIntelligentView _shouldAnimatePropertyWithKey:](&v13, sel__shouldAnimatePropertyWithKey_, v11);

    swift_bridgeObjectRelease();
  }
  LOBYTE(v8) = v10;
  return (char)v8;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC9DropletUI25AnimatableIntelligentView *v10;

  if (a4)
  {
    v6 = sub_23A84C21C();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a3;
  v10 = self;
  sub_23A84952C(a3, v6, v8);

  swift_bridgeObjectRelease();
}

- (_TtC9DropletUI25AnimatableIntelligentView)initWithFrame:(CGRect)a3
{
  _TtC9DropletUI25AnimatableIntelligentView *result;

  result = (_TtC9DropletUI25AnimatableIntelligentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView____lazy_storage___lightView));
}

@end
