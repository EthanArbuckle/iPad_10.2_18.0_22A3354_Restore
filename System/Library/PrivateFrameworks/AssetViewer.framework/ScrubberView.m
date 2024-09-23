@implementation ScrubberView

- (_TtC11AssetViewer12ScrubberView)initWithFrame:(CGRect)a3
{
  return (_TtC11AssetViewer12ScrubberView *)sub_1D940BCE0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  _TtC11AssetViewer12ScrubberView *v2;

  v2 = self;
  sub_1D940C18C();
}

- (void).cxx_destruct
{
  sub_1D93D6F14((uint64_t)self + OBJC_IVAR____TtC11AssetViewer12ScrubberView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer12ScrubberView____lazy_storage___playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer12ScrubberView____lazy_storage___skipBackButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer12ScrubberView____lazy_storage___skipForwardButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer12ScrubberView____lazy_storage___slider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer12ScrubberView____lazy_storage___elapsedTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer12ScrubberView____lazy_storage___remainingTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer12ScrubberView____lazy_storage___elapsedTimeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer12ScrubberView____lazy_storage___remainingTimeFormatter));

}

- (_TtC11AssetViewer12ScrubberView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9410488();
}

- (void)layoutSubviews
{
  char *v2;
  char *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for ScrubberView();
  v2 = (char *)v16.receiver;
  -[ScrubberView layoutSubviews](&v16, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v16.receiver, v16.super_class);
  v3 = &v2[OBJC_IVAR____TtC11AssetViewer12ScrubberView_lastLayoutBounds];
  v4 = *(double *)&v2[OBJC_IVAR____TtC11AssetViewer12ScrubberView_lastLayoutBounds];
  v5 = *(double *)&v2[OBJC_IVAR____TtC11AssetViewer12ScrubberView_lastLayoutBounds + 8];
  v6 = *(double *)&v2[OBJC_IVAR____TtC11AssetViewer12ScrubberView_lastLayoutBounds + 16];
  v7 = *(double *)&v2[OBJC_IVAR____TtC11AssetViewer12ScrubberView_lastLayoutBounds + 24];
  *(_QWORD *)v3 = v8;
  *((_QWORD *)v3 + 1) = v9;
  *((_QWORD *)v3 + 2) = v10;
  *((_QWORD *)v3 + 3) = v11;
  objc_msgSend(v2, sel_bounds);
  sub_1D940D450(v12, v13, v14, v15, v4, v5, v6, v7);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  uint64_t v5;
  _TtC11AssetViewer12ScrubberView *v6;
  uint64_t *v7;
  uint64_t v8;
  _TtC11AssetViewer12ScrubberView *v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  if (a3.width <= 414.0)
  {
    v8 = qword_1F01C2E68;
    v9 = self;
    if (v8 != -1)
      swift_once();
    v7 = &qword_1F01CF2D0;
  }
  else
  {
    v5 = qword_1F01C2E70;
    v6 = self;
    if (v5 != -1)
      swift_once();
    v7 = &qword_1F01CF2D8;
  }
  v10 = *(double *)v7;

  v11 = width;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)handlePlayPauseButton:(id)a3
{
  id v4;
  _TtC11AssetViewer12ScrubberView *v5;

  v4 = a3;
  v5 = self;
  sub_1D94105E0();

}

- (void)handleSkipBackButton:(id)a3
{
  id v4;
  _TtC11AssetViewer12ScrubberView *v5;

  v4 = a3;
  v5 = self;
  sub_1D9410644();

}

- (void)handleSkipForwardButton:(id)a3
{
  id v4;
  _TtC11AssetViewer12ScrubberView *v5;

  v4 = a3;
  v5 = self;
  sub_1D9410790();

}

- (void)updateTimeLabelFonts
{
  _TtC11AssetViewer12ScrubberView *v2;

  v2 = self;
  sub_1D940E85C();

}

- (void)startScrubbing:(id)a3
{
  id v4;
  _TtC11AssetViewer12ScrubberView *v5;

  v4 = a3;
  v5 = self;
  sub_1D94108D8();

}

- (void)didScrub:(id)a3
{
  id v4;
  _TtC11AssetViewer12ScrubberView *v5;

  v4 = a3;
  v5 = self;
  sub_1D940EA24(v4);

}

- (void)stopScrubbing:(id)a3
{
  id v4;
  _TtC11AssetViewer12ScrubberView *v5;

  v4 = a3;
  v5 = self;
  sub_1D94109DC();

}

@end
