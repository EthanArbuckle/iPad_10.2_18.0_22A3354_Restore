@implementation MultiAppFallbackCardCollectionViewCell

- (_TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell *)sub_100037208(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[BaseTodayCardCollectionViewCell layoutSubviews](&v4, "layoutSubviews");
  sub_1000377D4();
  sub_10003795C();
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_gradientView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (void)prepareForReuse
{
  char *v2;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[BaseTodayCardCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  sub_1002A5780(0);
  sub_100489DD0();
  sub_100055C20((uint64_t)_swiftEmptyArrayStorage);
  v3 = *(_QWORD *)&v2[OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_artworks];
  *(_QWORD *)&v2[OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_artworks] = _swiftEmptyArrayStorage;

  swift_bridgeObjectRelease(v3);
}

- (NSArray)accessibilityElements
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  Class isa;

  v3 = sub_10000DF3C((uint64_t *)&unk_1007F7C40);
  v4 = swift_allocObject(v3, 64, 7);
  *(_OWORD *)(v4 + 16) = xmmword_10066FBA0;
  v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_infoLayerLabelsView);
  *(_QWORD *)(v4 + 56) = type metadata accessor for TodayCardLabelsView(0);
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
  _TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell *v7;
  _TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell *v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
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
  -[MultiAppFallbackCardCollectionViewCell setAccessibilityElements:](&v9, "setAccessibilityElements:", isa);

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_overlay));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_overlayReusePool);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_multiAppIconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_infoLayerLabelsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_infoLayerOverlayContainer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension38MultiAppFallbackCardCollectionViewCell_artworks));
}

@end
