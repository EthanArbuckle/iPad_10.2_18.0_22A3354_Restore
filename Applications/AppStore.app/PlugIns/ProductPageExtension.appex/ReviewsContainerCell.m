@implementation ReviewsContainerCell

- (_TtC20ProductPageExtension20ReviewsContainerCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension20ReviewsContainerCell *)sub_10018C538(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension20ReviewsContainerCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100195A54();
}

- (void)dealloc
{
  _TtC20ProductPageExtension20ReviewsContainerCell *v2;

  v2 = self;
  sub_10018CA58();
}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_ratingsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_tapToRateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_actionsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_reviewSummaryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_ratingsSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_reviewsShelf));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_noRatingsView));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_editorsChoiceView));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_didSelectEditorsChoice), *(_QWORD *)&self->ratingsView[OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_didSelectEditorsChoice]);
  swift_unknownObjectRelease();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension20ReviewsContainerCell *v2;

  v2 = self;
  sub_10018CC70();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension20ReviewsContainerCell *v2;

  v2 = self;
  sub_10018C1EC();

}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)didTapEditorsChoice
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC20ProductPageExtension20ReviewsContainerCell *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_didSelectEditorsChoice);
  if (v2)
  {
    v3 = *(_QWORD *)&self->ratingsView[OBJC_IVAR____TtC20ProductPageExtension20ReviewsContainerCell_didSelectEditorsChoice];
    v5 = self;
    v4 = sub_100018918((uint64_t)v2, v3);
    v2(v4);
    sub_100018908((uint64_t)v2, v3);

  }
}

@end
