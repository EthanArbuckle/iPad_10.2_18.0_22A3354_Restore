@implementation CNAvatarPosterPairCollectionViewCell

- (void)layoutSubviews
{
  _TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell *v2;

  v2 = self;
  sub_18ACEACD8();

}

- (void)prepareForReuse
{
  _TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell *v2;

  v2 = self;
  sub_18ACEAE18();

}

- (_TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell *)sub_18ACEAEEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell *)sub_18ACEAFF8(a3);
}

- (void).cxx_destruct
{
  sub_18ACD7800((uint64_t)self + OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell_scrollableContentView));
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_18ACEB7A4(v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  id v8;
  double v9;
  _TtC10ContactsUI36CNAvatarPosterPairCollectionViewCell *v10;

  y = a4.y;
  v8 = a3;
  v10 = self;
  sub_18ACEBC80(v8, (uint64_t)a5, v9, y);

}

@end
