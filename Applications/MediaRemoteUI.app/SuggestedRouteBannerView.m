@implementation SuggestedRouteBannerView

- (void)layoutSubviews
{
  _TtC13MediaRemoteUI24SuggestedRouteBannerView *v2;

  v2 = self;
  sub_10002D8A8();

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v7;
  id v8;
  _TtC13MediaRemoteUI24SuggestedRouteBannerView *v9;

  y = a3.y;
  x = a3.x;
  v7 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView);
  v8 = a4;
  v9 = self;
  -[SuggestedRouteBannerView convertPoint:toCoordinateSpace:](v9, "convertPoint:toCoordinateSpace:", v7, x, y);
  LOBYTE(v7) = objc_msgSend(v7, "pointInside:withEvent:", v8);

  return (char)v7;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for SuggestedRouteBannerView();
  v7 = v13.receiver;
  v8 = a4;
  v9 = -[SuggestedRouteBannerView hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (v9)
  {
    v10 = v9;
    sub_100008314(0, (unint64_t *)&qword_10005A390, UIView_ptr);
    v11 = v7;
    v7 = v10;
    LOBYTE(v10) = static NSObject.== infix(_:_:)(v7, v11);

    if ((v10 & 1) == 0)
      return v7;
  }
  else
  {

  }
  v7 = 0;
  return v7;
}

- (void)updateUserInterfaceStyle
{
  _TtC13MediaRemoteUI24SuggestedRouteBannerView *v2;

  v2 = self;
  sub_10002DFE0();

}

- (_TtC13MediaRemoteUI24SuggestedRouteBannerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10002E240();
}

- (_TtC13MediaRemoteUI24SuggestedRouteBannerView)initWithFrame:(CGRect)a3
{
  _TtC13MediaRemoteUI24SuggestedRouteBannerView *result;

  result = (_TtC13MediaRemoteUI24SuggestedRouteBannerView *)_swift_stdlib_reportUnimplementedInitializer("MediaRemoteUI.SuggestedRouteBannerView", 38, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[13];
  uint64_t v10;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_activityRouteView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView____lazy_storage___titleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_subtitleView));
  v3 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96];
  v9[10] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute
                                          + 80];
  v9[11] = v3;
  v9[12] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute
                                          + 112];
  v10 = *(_QWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128];
  v4 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32];
  v9[6] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16];
  v9[7] = v4;
  v5 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64];
  v9[8] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48];
  v9[9] = v5;
  v6 = *(_OWORD *)&self->titleLabelMaxWidth[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  v9[2] = *(_OWORD *)&self->$__lazy_storage_$_titleView[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  v9[3] = v6;
  v7 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  v9[4] = *(_OWORD *)&self->maxActivityRouteViewSide[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  v9[5] = v7;
  v8 = *(_OWORD *)&self->actionButton[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  v9[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute);
  v9[1] = v8;
  sub_100006E80(v9);
}

@end
