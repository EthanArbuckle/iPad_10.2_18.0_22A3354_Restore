@implementation CollectionViewHeaderWithLinkCell

- (void)linkWasTapped
{
  void (*v2)(void);
  _TtC18HealthExperienceUI32CollectionViewHeaderWithLinkCell *v3;
  id v4;

  v2 = *(void (**)(void))((char *)&self->super.super.super.super.super.super.super.isa
                        + OBJC_IVAR____TtC18HealthExperienceUI32CollectionViewHeaderWithLinkCell_didTapLink);
  if (v2)
  {
    v3 = self;
    sub_1A9649378((uint64_t)v2);
    v4 = -[UIView viewController](v3, sel_viewController);
    v2();
    sub_1A9642C9C((uint64_t)v2);

  }
}

- (_TtC18HealthExperienceUI32CollectionViewHeaderWithLinkCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI32CollectionViewHeaderWithLinkCell_didTapLink);
  v9 = (objc_class *)type metadata accessor for CollectionViewHeaderWithLinkCell();
  *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[CollectionViewHeaderCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI32CollectionViewHeaderWithLinkCell)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI32CollectionViewHeaderWithLinkCell_didTapLink);
  v6 = (objc_class *)type metadata accessor for CollectionViewHeaderWithLinkCell();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[CollectionViewHeaderCell initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1A9642C9C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUI32CollectionViewHeaderWithLinkCell_didTapLink));
}

@end
