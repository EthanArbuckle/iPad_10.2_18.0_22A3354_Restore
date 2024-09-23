@implementation AppEventTodayCardCollectionViewCell

- (_TtC20ProductPageExtension35AppEventTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension35AppEventTodayCardCollectionViewCell *)sub_100060BA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)applySizeCategoryUpdates
{
  _TtC20ProductPageExtension35AppEventTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_100061148();

}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[StoryCardCollectionViewCell layoutSubviews](&v3, "layoutSubviews");
  sub_100061654();
  sub_100061944();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension35AppEventTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_100062560();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35AppEventTodayCardCollectionViewCell_formattedDateView));
}

@end
