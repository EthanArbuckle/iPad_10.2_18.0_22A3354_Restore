@implementation StoryCardCollectionViewCell

- (_TtC8AppStore27StoryCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore27StoryCardCollectionViewCell *)sub_10002B2E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC8AppStore27StoryCardCollectionViewCell *v2;

  v2 = self;
  sub_1000230D0();

}

- (void)prepareForReuse
{
  _TtC8AppStore27StoryCardCollectionViewCell *v2;

  v2 = self;
  sub_100208348();

}

- (NSArray)accessibilityElements
{
  _TtC8AppStore27StoryCardCollectionViewCell *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_1002086D0();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityElements:(id)a3
{
  uint64_t v4;
  _TtC8AppStore27StoryCardCollectionViewCell *v5;
  NSArray v6;
  _TtC8AppStore27StoryCardCollectionViewCell *v7;
  objc_super v8;

  if (a3)
  {
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
    v5 = self;
    v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v7 = self;
    v6.super.isa = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for StoryCardCollectionViewCell(0);
  -[StoryCardCollectionViewCell setAccessibilityElements:](&v8, "setAccessibilityElements:", v6.super.isa);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27StoryCardCollectionViewCell_mediaBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27StoryCardCollectionViewCell_mediaBackgroundViewMirror));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27StoryCardCollectionViewCell_infoLayer));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore27StoryCardCollectionViewCell_objectGraph);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore27StoryCardCollectionViewCell_todayCard);
}

@end
