@implementation ReviewsContainerCell

- (_TtC8AppStore20ReviewsContainerCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore20ReviewsContainerCell *)sub_10013CB48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore20ReviewsContainerCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  sub_100145504((uint64_t)v3, v4);
}

- (void)dealloc
{
  _TtC8AppStore20ReviewsContainerCell *v2;

  v2 = self;
  sub_10013D068();
}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_ratingsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_tapToRateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_actionsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_reviewSummaryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_ratingsSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_reviewsShelf));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_noRatingsView));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_pageTraits));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_editorsChoiceView));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_didSelectEditorsChoice), *(_QWORD *)&self->ratingsView[OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_didSelectEditorsChoice]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_scrollObserver));
}

- (void)layoutSubviews
{
  _TtC8AppStore20ReviewsContainerCell *v2;

  v2 = self;
  sub_10013D280();

}

- (void)prepareForReuse
{
  _TtC8AppStore20ReviewsContainerCell *v2;

  v2 = self;
  sub_10013D7B8();

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
  _TtC8AppStore20ReviewsContainerCell *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_didSelectEditorsChoice);
  if (v2)
  {
    v3 = *(_QWORD *)&self->ratingsView[OBJC_IVAR____TtC8AppStore20ReviewsContainerCell_didSelectEditorsChoice];
    v5 = self;
    v4 = sub_10003A340((uint64_t)v2, v3);
    v2(v4);
    sub_10003A350((uint64_t)v2, v3);

  }
}

@end
