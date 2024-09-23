@implementation HeroCarouselCollectionViewCell

- (_TtC22SubscribePageExtension30HeroCarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension30HeroCarouselCollectionViewCell *)sub_1003C4D28(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension30HeroCarouselCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003C6D50();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension30HeroCarouselCollectionViewCell *v2;

  v2 = self;
  sub_1003C5378();

}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension30HeroCarouselCollectionViewCell *v2;

  v2 = self;
  sub_1003C54C0();

}

- (void)applyLayoutAttributes:(id)a3
{
  __objc2_class **v4;
  _TtC22SubscribePageExtension30HeroCarouselCollectionViewCell *v5;

  v4 = (__objc2_class **)a3;
  v5 = self;
  sub_1003C5694(v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v7;
  id v8;
  _TtC22SubscribePageExtension30HeroCarouselCollectionViewCell *v9;
  _TtC22SubscribePageExtension30HeroCarouselCollectionViewCell *v10;
  _TtC22SubscribePageExtension30HeroCarouselCollectionViewCell *v11;
  _TtC22SubscribePageExtension30HeroCarouselCollectionViewCell *v12;
  uint64_t v13;
  BOOL v14;

  sub_100019574(0, (unint64_t *)&qword_1007FE4A0, NSObject_ptr);
  v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_tapGestureRecognizer);
  v8 = a3;
  v9 = (_TtC22SubscribePageExtension30HeroCarouselCollectionViewCell *)a4;
  v10 = self;
  if ((static NSObject.== infix(_:_:)(v8, v7) & 1) != 0
    && (v11 = (_TtC22SubscribePageExtension30HeroCarouselCollectionViewCell *)-[HeroCarouselCollectionViewCell view](v9, "view")) != 0)
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
  _TtC22SubscribePageExtension30HeroCarouselCollectionViewCell *v8;

  v3 = *(void (**)(id))((char *)&self->super.super.super.super.super.isa
                                 + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_didSelectHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->carouselView[OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_didSelectHandler];
    v6 = *(void **)(*(char **)((char *)&self->super.super.super.super.super.isa
                             + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_carouselView)
                  + OBJC_IVAR____TtC22SubscribePageExtension16HeroCarouselView_pageControl);
    v7 = a3;
    v8 = self;
    sub_100019320((uint64_t)v3, v5);
    v3(objc_msgSend(v6, "currentPage"));
    sub_100019310((uint64_t)v3, v5);

  }
}

- (void).cxx_destruct
{
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_carouselView));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_state, (uint64_t *)&unk_10080C160);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_tapGestureRecognizer));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_didSelectHandler), *(_QWORD *)&self->carouselView[OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_didSelectHandler]);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_impressionsCalculator);
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_impressionsUpdateBlock), *(_QWORD *)&self->carouselView[OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_impressionsUpdateBlock]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_videoPlaybackCoordinator);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_currentTitleEffect, (uint64_t *)&unk_10080C150);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_onUpdatePageTitleEffect));
  sub_100019370((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_playbackId);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension30HeroCarouselCollectionViewCell_visibilityTrackingView);
}

@end
