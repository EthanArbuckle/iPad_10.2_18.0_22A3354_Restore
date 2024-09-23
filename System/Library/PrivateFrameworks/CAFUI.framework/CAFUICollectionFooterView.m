@implementation CAFUICollectionFooterView

- (_TtC5CAFUI25CAFUICollectionFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC5CAFUI25CAFUICollectionFooterView *)CAFUICollectionFooterView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5CAFUI25CAFUICollectionFooterView)initWithCoder:(id)a3
{
  @objc CAFUICollectionHeaderView.init(coder:)((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC5CAFUI25CAFUICollectionFooterView_titleLabel, &OBJC_IVAR____TtC5CAFUI25CAFUICollectionFooterView_title);
}

- (void)prepareForReuse
{
  @objc CAFUICollectionHeaderView.prepareForReuse()(self, (uint64_t)a2, type metadata accessor for CAFUICollectionFooterView, &OBJC_IVAR____TtC5CAFUI25CAFUICollectionFooterView_titleLabel);
}

- (void).cxx_destruct
{
  @objc CAFUICollectionHeaderView.__ivar_destroyer((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5CAFUI25CAFUICollectionFooterView_titleLabel);
}

@end
