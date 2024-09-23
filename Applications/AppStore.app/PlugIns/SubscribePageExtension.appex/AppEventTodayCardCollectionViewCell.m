@implementation AppEventTodayCardCollectionViewCell

- (_TtC22SubscribePageExtension35AppEventTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension35AppEventTodayCardCollectionViewCell *)sub_100402CE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)applySizeCategoryUpdates
{
  _TtC22SubscribePageExtension35AppEventTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_100403288();

}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[StoryCardCollectionViewCell layoutSubviews](&v3, "layoutSubviews");
  sub_1004036B4();
  sub_1004039A4();

}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension35AppEventTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_1004045C0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35AppEventTodayCardCollectionViewCell_formattedDateView));
}

@end
