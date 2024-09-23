@implementation ContentSearchResultCollectionViewCell

- (_TtC20ProductPageExtension37ContentSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension37ContentSearchResultCollectionViewCell *)sub_10023C818(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension37ContentSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC20ProductPageExtension37ContentSearchResultCollectionViewCell *result;

  v5 = OBJC_IVAR____TtC20ProductPageExtension37ContentSearchResultCollectionViewCell_lockupView;
  v6 = objc_allocWithZone((Class)type metadata accessor for SmallSearchLockupView(0));
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC20ProductPageExtension37ContentSearchResultCollectionViewCell_screenshots;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LockupMediaView(0)), "init");
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension37ContentSearchResultCollectionViewCell_preferredImageSizes) = (Class)&_swiftEmptyDictionarySingleton;

  result = (_TtC20ProductPageExtension37ContentSearchResultCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ContentSearchResultCollectionViewCell.swift", 64, 2, 66, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension37ContentSearchResultCollectionViewCell *v2;

  v2 = self;
  sub_10023CAF8();

}

- (void)prepareForReuse
{
  char *v2;
  id v3;
  uint64_t v4;
  Swift::Bool v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ContentSearchResultCollectionViewCell();
  v2 = (char *)v7.receiver;
  v3 = -[ContentSearchResultCollectionViewCell prepareForReuse](&v7, "prepareForReuse");
  sub_10044FE7C((uint64_t)v3, v4, v5);
  v6 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension37ContentSearchResultCollectionViewCell_screenshots];
  sub_10048E89C();
  objc_msgSend(v6, "setHidden:", 0, v7.receiver, v7.super_class);

}

- (_TtC20ProductPageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension37ContentSearchResultCollectionViewCell_lockupView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension37ContentSearchResultCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension37ContentSearchResultCollectionViewCell_screenshots));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension37ContentSearchResultCollectionViewCell_preferredImageSizes));
}

@end
