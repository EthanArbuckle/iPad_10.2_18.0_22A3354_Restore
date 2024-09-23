@implementation SuggestedRouteBannerTitleView

- (CGSize)intrinsicContentSize
{
  _TtC13MediaRemoteUI29SuggestedRouteBannerTitleView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_10000582C();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SuggestedRouteBannerTitleView(0);
  v2 = (char *)v8.receiver;
  -[SuggestedRouteBannerTitleView layoutSubviews](&v8, "layoutSubviews");
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel], "bounds");
  v4 = v3;
  KeyPath = swift_getKeyPath(&unk_100033950);
  v6 = swift_getKeyPath(&unk_100033978);
  v7 = v4;
  static Published.subscript.setter(&v7, v2, KeyPath, v6);
}

- (_TtC13MediaRemoteUI29SuggestedRouteBannerTitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100006B1C();
}

- (_TtC13MediaRemoteUI29SuggestedRouteBannerTitleView)initWithFrame:(CGRect)a3
{
  _TtC13MediaRemoteUI29SuggestedRouteBannerTitleView *result;

  result = (_TtC13MediaRemoteUI29SuggestedRouteBannerTitleView *)_swift_stdlib_reportUnimplementedInitializer("MediaRemoteUI.SuggestedRouteBannerTitleView", 43, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
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
  char *v9;
  uint64_t v10;
  _OWORD v11[13];
  uint64_t v12;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_leadingLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_trailingLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelPlayingTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelNotPlayingTrailingConstraint));
  v3 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                      + 112];
  v11[10] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                           + 96];
  v11[11] = v3;
  v11[12] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                           + 128];
  v12 = *(_QWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                       + 144];
  v4 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                      + 48];
  v11[6] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                          + 32];
  v11[7] = v4;
  v5 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                      + 80];
  v11[8] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                          + 64];
  v11[9] = v5;
  v6 = *(_OWORD *)&self->titleLabelNotPlayingTrailingConstraint[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  v11[2] = *(_OWORD *)&self->trailingLayoutGuide[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  v11[3] = v6;
  v7 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                      + 16];
  v11[4] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  v11[5] = v7;
  v8 = *(_OWORD *)&self->waveformPackageView[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  v11[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute);
  v11[1] = v8;
  sub_100006E80(v11);
  v9 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView__availableTitleWidth;
  v10 = sub_100006CE8((uint64_t *)&unk_100058B80);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
}

@end
