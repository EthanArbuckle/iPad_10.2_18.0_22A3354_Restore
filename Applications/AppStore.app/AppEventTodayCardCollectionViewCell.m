@implementation AppEventTodayCardCollectionViewCell

- (_TtC8AppStore35AppEventTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore35AppEventTodayCardCollectionViewCell *)sub_1003B7308(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)applySizeCategoryUpdates
{
  _TtC8AppStore35AppEventTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_1003B78A8();

}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[StoryCardCollectionViewCell layoutSubviews](&v3, "layoutSubviews");
  sub_1003B7CD4();
  sub_1003B7FC4();

}

- (void)prepareForReuse
{
  _TtC8AppStore35AppEventTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_1003B8B1C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35AppEventTodayCardCollectionViewCell_formattedDateView));
}

@end
