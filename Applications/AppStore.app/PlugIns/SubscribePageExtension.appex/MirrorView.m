@implementation MirrorView

- (_TtC22SubscribePageExtension10MirrorView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC22SubscribePageExtension10MirrorView *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC22SubscribePageExtension10MirrorView_sourceImageView, 0);
  v5 = OBJC_IVAR____TtC22SubscribePageExtension10MirrorView_artworkLayer;
  v6 = objc_allocWithZone((Class)CALayer);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension10MirrorView_imageKVOContext) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension10MirrorView_imageObserversAdded) = 0;

  result = (_TtC22SubscribePageExtension10MirrorView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/MirrorView.swift", 39, 2, 62, 0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  void *Strong;
  _TtC22SubscribePageExtension10MirrorView *v4;
  NSString v5;
  objc_super v6;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC22SubscribePageExtension10MirrorView_sourceImageView);
  v4 = self;
  if (Strong)
  {
    v5 = String._bridgeToObjectiveC()();
    objc_msgSend(Strong, "removeObserver:forKeyPath:", v4, v5);

  }
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for MirrorView();
  -[MirrorView dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension10MirrorView_sourceImageView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension10MirrorView_artworkLayer));
}

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MirrorView();
  return -[MirrorView backgroundColor](&v3, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  char *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MirrorView();
  v4 = (char *)v10.receiver;
  v5 = a3;
  -[MirrorView setBackgroundColor:](&v10, "setBackgroundColor:", v5);
  v6 = *(void **)&v4[OBJC_IVAR____TtC22SubscribePageExtension10MirrorView_artworkLayer];
  v7 = objc_msgSend(v4, "backgroundColor", v10.receiver, v10.super_class);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "CGColor");

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v6, "setBackgroundColor:", v9);

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension10MirrorView *v2;

  v2 = self;
  sub_1001DFB70();

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _TtC22SubscribePageExtension10MirrorView *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  objc_class *v18;
  id v19;
  _TtC22SubscribePageExtension10MirrorView *v20;
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
  v17 = sub_1001E0328();
  v18 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v16, (char *)&type metadata for Any + 8, v17);

LABEL_8:
  sub_1001DFF9C(v10, v12, (uint64_t)v21, v18, (uint64_t)a6);

  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v12);
  sub_1000131E0((uint64_t)v21);
}

- (_TtC22SubscribePageExtension10MirrorView)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension10MirrorView *result;

  result = (_TtC22SubscribePageExtension10MirrorView *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.MirrorView", 33, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
