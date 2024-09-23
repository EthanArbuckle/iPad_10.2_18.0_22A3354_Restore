@implementation CAFUICollectionHeaderView

- (_TtC5CAFUI25CAFUICollectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC5CAFUI25CAFUICollectionHeaderView *)CAFUICollectionHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5CAFUI25CAFUICollectionHeaderView)initWithCoder:(id)a3
{
  @objc CAFUICollectionHeaderView.init(coder:)((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC5CAFUI25CAFUICollectionHeaderView_titleLabel, &OBJC_IVAR____TtC5CAFUI25CAFUICollectionHeaderView_title);
}

- (void)prepareForReuse
{
  @objc CAFUICollectionHeaderView.prepareForReuse()(self, (uint64_t)a2, type metadata accessor for CAFUICollectionHeaderView, &OBJC_IVAR____TtC5CAFUI25CAFUICollectionHeaderView_titleLabel);
}

- (void).cxx_destruct
{
  @objc CAFUICollectionHeaderView.__ivar_destroyer((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5CAFUI25CAFUICollectionHeaderView_titleLabel);
}

@end
