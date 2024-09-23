@implementation CarouselItemModulePlatterView

- (_TtC8AppStore29CarouselItemModulePlatterView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29CarouselItemModulePlatterView *)sub_100597BC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore29CarouselItemModulePlatterView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100598DA4();
}

- (void)layoutSubviews
{
  _TtC8AppStore29CarouselItemModulePlatterView *v2;

  v2 = self;
  sub_10059809C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore29CarouselItemModulePlatterView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_100597A44(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29CarouselItemModulePlatterView_materialbackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29CarouselItemModulePlatterView_lockupCollectionView));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore29CarouselItemModulePlatterView_displayOptions;
  v4 = type metadata accessor for HeroCarouselItemOverlay.DisplayOptions(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore29CarouselItemModulePlatterView_selectionHandler), *(_QWORD *)&self->materialbackground[OBJC_IVAR____TtC8AppStore29CarouselItemModulePlatterView_selectionHandler]);
}

@end
