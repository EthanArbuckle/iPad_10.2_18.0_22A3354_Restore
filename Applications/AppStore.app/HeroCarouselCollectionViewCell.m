@implementation HeroCarouselCollectionViewCell

- (_TtC8AppStore30HeroCarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore30HeroCarouselCollectionViewCell *)sub_10056A8B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore30HeroCarouselCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10056C884();
}

- (void)layoutSubviews
{
  _TtC8AppStore30HeroCarouselCollectionViewCell *v2;

  v2 = self;
  sub_10056AF04();

}

- (void)prepareForReuse
{
  _TtC8AppStore30HeroCarouselCollectionViewCell *v2;

  v2 = self;
  sub_10056B04C();

}

- (void)applyLayoutAttributes:(id)a3
{
  uint64_t *v4;
  _TtC8AppStore30HeroCarouselCollectionViewCell *v5;

  v4 = (uint64_t *)a3;
  v5 = self;
  sub_10056B220(v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v7;
  id v8;
  _TtC8AppStore30HeroCarouselCollectionViewCell *v9;
  _TtC8AppStore30HeroCarouselCollectionViewCell *v10;
  _TtC8AppStore30HeroCarouselCollectionViewCell *v11;
  _TtC8AppStore30HeroCarouselCollectionViewCell *v12;
  BOOL v13;

  sub_100008FE4(0, (unint64_t *)&qword_100832BD0, NSObject_ptr);
  v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_tapGestureRecognizer);
  v8 = a3;
  v9 = (_TtC8AppStore30HeroCarouselCollectionViewCell *)a4;
  v10 = self;
  if ((static NSObject.== infix(_:_:)(v8, v7) & 1) != 0
    && (v11 = (_TtC8AppStore30HeroCarouselCollectionViewCell *)-[HeroCarouselCollectionViewCell view](v9, "view")) != 0)
  {
    v12 = v11;
    type metadata accessor for HeroCarouselItemView();
    v13 = swift_dynamicCastClass(v12) != 0;

    v9 = v10;
    v10 = v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)handleTap:(id)a3
{
  void (*v3)(id);
  uint64_t v5;
  void *v6;
  id v7;
  _TtC8AppStore30HeroCarouselCollectionViewCell *v8;

  v3 = *(void (**)(id))((char *)&self->super.super.super.super.super.isa
                                 + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_didSelectHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->carouselView[OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_didSelectHandler];
    v6 = *(void **)(*(char **)((char *)&self->super.super.super.super.super.isa
                             + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_carouselView)
                  + OBJC_IVAR____TtC8AppStore16HeroCarouselView_pageControl);
    v7 = a3;
    v8 = self;
    sub_10003A340((uint64_t)v3, v5);
    v3(objc_msgSend(v6, "currentPage"));
    sub_10003A350((uint64_t)v3, v5);

  }
}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_carouselView));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_state, (uint64_t *)&unk_10084DCD0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_tapGestureRecognizer));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_didSelectHandler), *(_QWORD *)&self->carouselView[OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_didSelectHandler]);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_impressionsCalculator);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_impressionsUpdateBlock), *(_QWORD *)&self->carouselView[OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_impressionsUpdateBlock]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_videoPlaybackCoordinator);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_currentTitleEffect, (uint64_t *)&unk_10084DCC0);
  swift_release();
  sub_10007E32C((uint64_t)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_playbackId);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore30HeroCarouselCollectionViewCell_visibilityTrackingView);
}

@end
