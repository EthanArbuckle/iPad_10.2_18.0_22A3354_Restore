@implementation AnimatableLightView

- (void)layoutSubviews
{
  id v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AnimatableLightView();
  v2 = v5.receiver;
  -[AnimatableLightView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = sub_23A848E8C();
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_);

  v4 = sub_23A848F4C();
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView *v8;
  _TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView *v9;
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
  v7 = qword_2569C25E0;
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
  if ((sub_23A83E2BC(v4, v6, (_QWORD *)qword_2569C3140) & 1) != 0)
  {

    swift_bridgeObjectRelease();
    v10 = 1;
  }
  else
  {
    v11 = (void *)sub_23A84C210();
    v13.receiver = v9;
    v13.super_class = (Class)type metadata accessor for AnimatableLightView();
    v10 = -[AnimatableLightView _shouldAnimatePropertyWithKey:](&v13, sel__shouldAnimatePropertyWithKey_, v11);

    swift_bridgeObjectRelease();
  }
  LOBYTE(v8) = v10;
  return (char)v8;
}

- (_TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView)initWithFrame:(CGRect)a3 preferringAudioReactivity:(BOOL)a4
{
  _TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView *result;

  result = (_TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___noiseView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___whiteView));
}

@end
