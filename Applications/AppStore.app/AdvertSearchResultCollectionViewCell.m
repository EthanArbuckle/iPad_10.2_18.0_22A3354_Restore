@implementation AdvertSearchResultCollectionViewCell

- (_TtC8AppStore36AdvertSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore36AdvertSearchResultCollectionViewCell *)sub_1003DEF04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore36AdvertSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  _TtC8AppStore36AdvertSearchResultCollectionViewCell *result;

  result = (_TtC8AppStore36AdvertSearchResultCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/AdvertSearchResultCollectionViewCell.swift", 51, 2, 64, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AdvertSearchResultCollectionViewCell();
  v2 = (char *)v4.receiver;
  -[AdvertSearchResultCollectionViewCell layoutSubviews](&v4, "layoutSubviews");
  v3 = *(id *)&v2[OBJC_IVAR____TtC8AppStore36AdvertSearchResultCollectionViewCell_advertsContentView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (void)prepareForReuse
{
  char *v2;
  id v3;
  uint64_t v4;
  Swift::Bool v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AdvertSearchResultCollectionViewCell();
  v2 = (char *)v6.receiver;
  -[AdvertSearchResultCollectionViewCell prepareForReuse](&v6, "prepareForReuse");
  v3 = *(id *)&v2[OBJC_IVAR____TtC8AppStore36AdvertSearchResultCollectionViewCell_advertsContentView];
  sub_1000F90A4((uint64_t)v3, v4, v5);
  sub_1001BED40();

}

- (_TtC8AppStore21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC8AppStore21SmallSearchLockupView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8AppStore36AdvertSearchResultCollectionViewCell_advertsContentView)
                                                                                         + OBJC_IVAR____TtC8AppStore30AdvertsSearchResultContentView_lockupView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AdvertSearchResultCollectionViewCell_advertsContentView));
}

@end
