@implementation SmallBreakoutCollectionViewCell

- (_TtC8AppStore31SmallBreakoutCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31SmallBreakoutCollectionViewCell *)sub_10014EC90(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31SmallBreakoutCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10014F8F8();
}

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[SmallBreakoutCollectionViewCell backgroundColor](&v3, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC8AppStore31SmallBreakoutCollectionViewCell *v7;
  void *v8;
  id v9;
  UIColor *v10;
  objc_super v11;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v12.receiver = self;
  v12.super_class = ObjectType;
  v6 = a3;
  v7 = self;
  -[SmallBreakoutCollectionViewCell setBackgroundColor:](&v12, "setBackgroundColor:", v6);
  v8 = *(Class *)((char *)&v7->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_iconView);
  v11.receiver = v7;
  v11.super_class = ObjectType;
  v9 = v8;
  v10 = -[SmallBreakoutCollectionViewCell backgroundColor](&v11, "backgroundColor");
  ArtworkView.backgroundColor.setter(v10);

}

- (void)layoutSubviews
{
  _TtC8AppStore31SmallBreakoutCollectionViewCell *v2;

  v2 = self;
  sub_10014F1D4();

}

- (void)prepareForReuse
{
  _TtC8AppStore31SmallBreakoutCollectionViewCell *v2;

  v2 = self;
  sub_10014F3EC();

}

- (_TtC8AppStore19BreakoutDetailsView)accessibilityDetailsView
{
  return (_TtC8AppStore19BreakoutDetailsView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                       + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_detailsView));
}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_backgroundArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_detailsView));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore31SmallBreakoutCollectionViewCell_pageTraits));
}

@end
