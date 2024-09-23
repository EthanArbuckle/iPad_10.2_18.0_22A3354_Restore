@implementation ASUIProductCarouselView

- (void)pageControlChangedWithPageControl:(id)a3
{
  id v4;
  _TtC16AccessorySetupUI23ASUIProductCarouselView *v5;

  v4 = a3;
  v5 = self;
  sub_100005174(objc_msgSend(v4, "currentPage"), 1);

}

- (void)layoutSubviews
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ASUIProductCarouselView();
  v2 = v10.receiver;
  -[ASUIProductCarouselView layoutSubviews](&v10, "layoutSubviews");
  v3 = (void *)objc_opt_self(UIView);
  v4 = swift_allocObject(&unk_100051268, 24, 7);
  *(_QWORD *)(v4 + 16) = v2;
  v8[4] = sub_1000096BC;
  v9 = v4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_1000122C8;
  v8[3] = &unk_100051280;
  v5 = _Block_copy(v8);
  v6 = v9;
  v7 = v2;
  swift_release(v6);
  objc_msgSend(v3, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v5, 0, 1.0, 0.0, 0.8, 0.0);
  _Block_release(v5);

}

- (_TtC16AccessorySetupUI23ASUIProductCarouselView)initWithFrame:(CGRect)a3
{
  return (_TtC16AccessorySetupUI23ASUIProductCarouselView *)sub_100008940(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16AccessorySetupUI23ASUIProductCarouselView)initWithCoder:(id)a3
{
  return (_TtC16AccessorySetupUI23ASUIProductCarouselView *)sub_100008B2C(a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentPageIdxPublisher));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_currentNumberOfPagesPublisher));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pages));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_devices));
  swift_bridgeObjectRelease(*(_QWORD *)&self->currentPageIdxPublisher[OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_appName]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_otaLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingOTALabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pageControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingPageControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingPageControlHeightConstraint));
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC16AccessorySetupUI23ASUIProductCarouselView *v5;

  v4 = a3;
  v5 = self;
  sub_100009208();

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  id v8;
  _TtC16AccessorySetupUI23ASUIProductCarouselView *v9;

  x = a4.x;
  v8 = a3;
  v9 = self;
  sub_1000092FC(&a5->x, x);

}

@end
