@implementation ReviewsContainerCell

- (_TtC22SubscribePageExtension20ReviewsContainerCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension20ReviewsContainerCell *)sub_10003BD80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension20ReviewsContainerCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100044098();
}

- (void)dealloc
{
  _TtC22SubscribePageExtension20ReviewsContainerCell *v2;

  v2 = self;
  sub_10003C2A0();
}

- (void).cxx_destruct
{
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_ratingsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_tapToRateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_actionsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_reviewSummaryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_ratingsSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_reviewsShelf));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_noRatingsView));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_pageTraits));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_editorsChoiceView));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_didSelectEditorsChoice), *(_QWORD *)&self->ratingsView[OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_didSelectEditorsChoice]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_scrollObserver));
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension20ReviewsContainerCell *v2;

  v2 = self;
  sub_10003C4B8();

}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension20ReviewsContainerCell *v2;

  v2 = self;
  sub_10003C9F0();

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
  _TtC22SubscribePageExtension20ReviewsContainerCell *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_didSelectEditorsChoice);
  if (v2)
  {
    v3 = *(_QWORD *)&self->ratingsView[OBJC_IVAR____TtC22SubscribePageExtension20ReviewsContainerCell_didSelectEditorsChoice];
    v5 = self;
    v4 = sub_100019320((uint64_t)v2, v3);
    v2(v4);
    sub_100019310((uint64_t)v2, v3);

  }
}

@end
