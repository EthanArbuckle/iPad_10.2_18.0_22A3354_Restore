@implementation CondensedAdLockupWithIconBackgroundView

- (_TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView *)sub_1004CF830(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004D02F8();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView *v2;

  v2 = self;
  sub_1004CFD0C();

}

- (NSArray)accessibilityElements
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  Class isa;

  v3 = sub_10000DAF8(&qword_1008091A0);
  v4 = swift_allocObject(v3, 64, 7);
  *(_OWORD *)(v4 + 16) = xmmword_100640720;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView_lockupView);
  *(_QWORD *)(v4 + 56) = type metadata accessor for TodayCardLockupView();
  *(_QWORD *)(v4 + 32) = v5;
  v6 = v5;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (void)setAccessibilityElements:(id)isa
{
  objc_class *ObjectType;
  uint64_t v6;
  _TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView *v7;
  _TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView *v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, (char *)&type metadata for Any + 8);
    v7 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v8 = self;
  }
  v9.receiver = self;
  v9.super_class = ObjectType;
  -[CondensedAdLockupWithIconBackgroundView setAccessibilityElements:](&v9, "setAccessibilityElements:", isa);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView_backgroundArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView_backgroundEffectView));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension39CondensedAdLockupWithIconBackgroundView_pageTraits));
}

@end
