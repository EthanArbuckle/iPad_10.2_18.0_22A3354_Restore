@implementation UberHeaderView

- (_TtC22SubscribePageExtension14UberHeaderView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC22SubscribePageExtension14UberHeaderView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension14UberHeaderView_isRubberbanding) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension14UberHeaderView_reflectionOutset) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension14UberHeaderView_contentBottomInset) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension14UberHeaderView_navigationItem) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension14UberHeaderView_sizeChangeObserver);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC22SubscribePageExtension14UberHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/UberHeaderView.swift", 43, 2, 86, 0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  _TtC22SubscribePageExtension14UberHeaderView *v2;

  v2 = self;
  sub_10053C5FC();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension14UberHeaderView_uber));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14UberHeaderView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14UberHeaderView_legibilityGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14UberHeaderView_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14UberHeaderView_navigationItem));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension14UberHeaderView_sizeChangeObserver), *(_QWORD *)&self->uber[OBJC_IVAR____TtC22SubscribePageExtension14UberHeaderView_sizeChangeObserver]);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _TtC22SubscribePageExtension14UberHeaderView *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  id v19;
  _TtC22SubscribePageExtension14UberHeaderView *v20;
  _OWORD v21[2];

  if (a3)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v21, 0, sizeof(v21));
    v19 = a5;
    v20 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain(a4);
  v13 = a5;
  v14 = self;
  _bridgeAnyObjectToAny(_:)(v21, a4);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  v16 = v15;
  v17 = sub_10001F65C((unint64_t *)&qword_1007F3CB8, 255, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)byte_10066F78C);
  v18 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v16, (char *)&type metadata for Any + 8, v17);

LABEL_8:
  sub_10053C7C4(v10, v12, (uint64_t)v21, v18, a6);

  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v12);
  sub_100011088((uint64_t)v21, &qword_1007F6E90);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension14UberHeaderView *v6;

  v5 = a3;
  v6 = self;
  sub_10053CCF4(a3);

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension14UberHeaderView *v2;

  v2 = self;
  sub_10053CE18();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC22SubscribePageExtension14UberHeaderView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_10053D324((uint64_t)a4, x, y);

  return v10;
}

- (_TtC22SubscribePageExtension14UberHeaderView)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension14UberHeaderView *result;

  result = (_TtC22SubscribePageExtension14UberHeaderView *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.UberHeaderView", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
