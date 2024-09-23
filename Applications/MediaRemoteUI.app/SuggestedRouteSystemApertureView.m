@implementation SuggestedRouteSystemApertureView

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
  v8.super_class = (Class)type metadata accessor for SuggestedRouteSystemApertureView(0);
  v2 = (char *)v8.receiver;
  -[SuggestedRouteSystemApertureView layoutSubviews](&v8, "layoutSubviews");
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabel], "bounds");
  v4 = v3;
  KeyPath = swift_getKeyPath(&unk_100033C00);
  v6 = swift_getKeyPath(&unk_100033C28);
  v7 = v4;
  static Published.subscript.setter(&v7, v2, KeyPath, v6);
}

- (_TtC13MediaRemoteUI32SuggestedRouteSystemApertureView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10000C550();
}

- (_TtC13MediaRemoteUI32SuggestedRouteSystemApertureView)initWithFrame:(CGRect)a3
{
  _TtC13MediaRemoteUI32SuggestedRouteSystemApertureView *result;

  result = (_TtC13MediaRemoteUI32SuggestedRouteSystemApertureView *)_swift_stdlib_reportUnimplementedInitializer("MediaRemoteUI.SuggestedRouteSystemApertureView", 46, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
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
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_activityRouteView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_bottomLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelPlayingTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelPlayingWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelNotPlayingTrailingConstraint));
  swift_bridgeObjectRelease(*(_QWORD *)&self->activityRouteView[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageStateNameOn]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->activityRouteView[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageStateNameOff]);
  v3 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute
                                      + 56];
  v11[10] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute
                                           + 40];
  v11[11] = v3;
  v11[12] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute
                                           + 72];
  v12 = *(_QWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute
                                       + 88];
  v4 = *(_OWORD *)&self->waveformPackageStateNameOff[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute
                                                   + 8];
  v11[6] = *(_OWORD *)&self->waveformPackageStateNameOn[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute
                                                      + 8];
  v11[7] = v4;
  v5 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute
                                      + 24];
  v11[8] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute
                                          + 8];
  v11[9] = v5;
  v6 = *(_OWORD *)&self->actionButton[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
  v11[2] = *(_OWORD *)&self->topLabel[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
  v11[3] = v6;
  v7 = *(_OWORD *)&self->routeLabelNotPlayingTrailingConstraint[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
  v11[4] = *(_OWORD *)&self->topLabelPlayingTrailingConstraint[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
  v11[5] = v7;
  v8 = *(_OWORD *)&self->routeLabel[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
  v11[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute);
  v11[1] = v8;
  sub_100006E80(v11);
  v9 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView__availableTitleWidth;
  v10 = sub_100006CE8((uint64_t *)&unk_100058B80);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
}

@end
