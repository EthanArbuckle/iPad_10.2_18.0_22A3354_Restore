@implementation HeroCarouselScrollView

- (_TtC22SubscribePageExtension22HeroCarouselScrollView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension22HeroCarouselScrollView *)sub_100464278(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension22HeroCarouselScrollView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100467804();
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HeroCarouselScrollView();
  -[HeroCarouselScrollView frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  _TtC22SubscribePageExtension22HeroCarouselScrollView *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  objc_super v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for HeroCarouselScrollView();
  v19.receiver = self;
  v19.super_class = v8;
  v9 = self;
  -[HeroCarouselScrollView frame](&v19, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18.receiver = v9;
  v18.super_class = v8;
  -[HeroCarouselScrollView setFrame:](&v18, "setFrame:", x, y, width, height);
  -[HeroCarouselScrollView frame](v9, "frame");
  v21.origin.x = v11;
  v21.origin.y = v13;
  v21.size.width = v15;
  v21.size.height = v17;
  if (!CGRectEqualToRect(v20, v21))
    *((_BYTE *)&v9->super.super.super.super.isa
    + OBJC_IVAR____TtC22SubscribePageExtension22HeroCarouselScrollView_needsPageViewLayout) = 1;

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension22HeroCarouselScrollView *v2;

  v2 = self;
  sub_100464F54();

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension22HeroCarouselScrollView *v5;

  v4 = a3;
  v5 = self;
  sub_100467920();

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension22HeroCarouselScrollView *v5;

  v4 = a3;
  v5 = self;
  sub_100467A20();

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;
  _TtC22SubscribePageExtension22HeroCarouselScrollView *v6;

  if (!a4)
  {
    v5 = a3;
    v6 = self;
    sub_100466E64(1);

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension22HeroCarouselScrollView *v5;

  v4 = a3;
  v5 = self;
  sub_100466E64(1);

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension22HeroCarouselScrollView *v5;

  v4 = a3;
  v5 = self;
  sub_100466D68(v4);

}

- (void).cxx_destruct
{
  sub_100010E34((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension22HeroCarouselScrollView_pagingDelegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension22HeroCarouselScrollView_pageTrackerLookup));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension22HeroCarouselScrollView_pageTrackers));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension22HeroCarouselScrollView_focusedPageTracker));
}

@end
