@implementation HeroCarouselCollectionViewCell

- (_TtC20ProductPageExtension30HeroCarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension30HeroCarouselCollectionViewCell *)sub_10021147C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension30HeroCarouselCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002131B4();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension30HeroCarouselCollectionViewCell *v2;

  v2 = self;
  sub_100211ACC();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension30HeroCarouselCollectionViewCell *v2;

  v2 = self;
  sub_100211C14();

}

- (void)applyLayoutAttributes:(id)a3
{
  uint64_t (**v4)();
  _TtC20ProductPageExtension30HeroCarouselCollectionViewCell *v5;

  v4 = (uint64_t (**)())a3;
  v5 = self;
  sub_100211DE8(v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v7;
  id v8;
  _TtC20ProductPageExtension30HeroCarouselCollectionViewCell *v9;
  _TtC20ProductPageExtension30HeroCarouselCollectionViewCell *v10;
  _TtC20ProductPageExtension30HeroCarouselCollectionViewCell *v11;
  _TtC20ProductPageExtension30HeroCarouselCollectionViewCell *v12;
  uint64_t v13;
  BOOL v14;

  sub_100018B6C(0, (unint64_t *)&qword_1008119A0, NSObject_ptr);
  v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_tapGestureRecognizer);
  v8 = a3;
  v9 = (_TtC20ProductPageExtension30HeroCarouselCollectionViewCell *)a4;
  v10 = self;
  if ((static NSObject.== infix(_:_:)(v8, v7) & 1) != 0
    && (v11 = (_TtC20ProductPageExtension30HeroCarouselCollectionViewCell *)-[HeroCarouselCollectionViewCell view](v9, "view")) != 0)
  {
    v12 = v11;
    v13 = type metadata accessor for HeroCarouselItemView();
    v14 = swift_dynamicCastClass(v12, v13) != 0;

    v9 = v10;
    v10 = v12;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)handleTap:(id)a3
{
  void (*v3)(id);
  uint64_t v5;
  void *v6;
  id v7;
  _TtC20ProductPageExtension30HeroCarouselCollectionViewCell *v8;

  v3 = *(void (**)(id))((char *)&self->super.super.super.super.super.isa
                                 + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_didSelectHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->carouselView[OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_didSelectHandler];
    v6 = *(void **)(*(char **)((char *)&self->super.super.super.super.super.isa
                             + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_carouselView)
                  + OBJC_IVAR____TtC20ProductPageExtension16HeroCarouselView_pageControl);
    v7 = a3;
    v8 = self;
    sub_100018918((uint64_t)v3, v5);
    v3(objc_msgSend(v6, "currentPage"));
    sub_100018908((uint64_t)v3, v5);

  }
}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_carouselView));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_state, &qword_10080E3F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_tapGestureRecognizer));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_didSelectHandler), *(_QWORD *)&self->carouselView[OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_didSelectHandler]);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_impressionsCalculator);
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_impressionsUpdateBlock), *(_QWORD *)&self->carouselView[OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_impressionsUpdateBlock]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_videoPlaybackCoordinator);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_currentTitleEffect, (uint64_t *)&unk_100815FD0);
  swift_release();
  sub_100018968((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_playbackId);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselCollectionViewCell_visibilityTrackingView);
}

@end
