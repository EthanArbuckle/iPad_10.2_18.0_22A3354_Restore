@implementation CollectionHeaderWithIconReusableView

- (_TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView *)CollectionHeaderWithIconReusableView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView____lazy_storage___contentView) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  char *v3;
  double Width;
  objc_super v5;
  CGRect v6;
  CGRect v7;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CollectionHeaderWithIconReusableView();
  v2 = v5.receiver;
  -[CollectionHeaderWithIconReusableView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = sub_1A98FFAF4();
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  Width = CGRectGetWidth(v6);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setFrame_, 0.0, 2.0, Width, CGRectGetHeight(v7) + -4.0 + -8.0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView *v5;
  char *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1A98FFAF4();
  objc_msgSend(v6, sel_sizeThatFits_, width, height);
  v8 = v7;
  v10 = v9;

  v11 = v10 + 8.0 + 4.0;
  v12 = v8;
  result.height = v11;
  result.width = v12;
  return result;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView *v5;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_size);
  -[CollectionHeaderWithIconReusableView sizeThatFits:](v5, sel_sizeThatFits_);
  objc_msgSend(v4, sel_setSize_);

  return v4;
}

- (void).cxx_destruct
{
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI36CollectionHeaderWithIconReusableView____lazy_storage___contentView));
}

@end
