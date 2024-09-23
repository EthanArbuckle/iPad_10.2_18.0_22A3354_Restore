@implementation SuggestedRouteConnectedViewController

- (_TtC13MediaRemoteUI37SuggestedRouteConnectedViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000240E8();
}

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_activeLayoutMode) = (Class)a3;
}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_contentRole);
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredLayoutMode);
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_maximumLayoutMode);
}

- (int64_t)preferredCustomLayout
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredCustomLayout);
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_elementIdentifier));
}

- (NSString)associatedAppBundleIdentifier
{
  void *v2;
  _TtC13MediaRemoteUI37SuggestedRouteConnectedViewController *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration);
  v3 = self;
  v4 = objc_msgSend(v2, "bundleIdentifierAffinity");
  if (v4)
  {
    v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v7 = v6;

    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {

    v8 = 0;
  }
  return (NSString *)v8;
}

- (unint64_t)presentationBehaviors
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_presentationBehaviors);
}

- (void)setPresentationBehaviors:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_presentationBehaviors) = (Class)a3;
}

- (BOOL)preventsInteractiveDismissal
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preventsInteractiveDismissal);
}

- (void)setPreventsInteractiveDismissal:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preventsInteractiveDismissal) = a3;
}

- (BOOL)preventsAutomaticDismissal
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preventsAutomaticDismissal);
}

- (void)setPreventsAutomaticDismissal:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preventsAutomaticDismissal) = a3;
}

- (UIColor)keyColor
{
  return (UIColor *)objc_msgSend((id)objc_opt_self(UIColor), "systemTealColor");
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_airPlayImageView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_trailingAccessoryView));
}

- (double)preferredHeightForBottomSafeArea
{
  return *(double *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredHeightForBottomSafeArea);
}

- (void)setPreferredHeightForBottomSafeArea:(double)a3
{
  *(double *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredHeightForBottomSafeArea) = a3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)handleCompactOrMinimalViewTapEvent
{
  uint64_t v2;
  _TtC13MediaRemoteUI37SuggestedRouteConnectedViewController *v3;

  v3 = self;
  sub_100020D34((uint64_t)v3, v2);

}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13MediaRemoteUI37SuggestedRouteConnectedViewController *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10002132C();
  sub_100020F28();

}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13MediaRemoteUI37SuggestedRouteConnectedViewController *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100020F28();

}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  _OWORD v10[13];
  uint64_t v11;

  v3 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                      + 96];
  v10[10] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                           + 80];
  v10[11] = v3;
  v10[12] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                           + 112];
  v11 = *(_QWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                       + 128];
  v4 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                      + 32];
  v10[6] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                          + 16];
  v10[7] = v4;
  v5 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                      + 64];
  v10[8] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                          + 48];
  v10[9] = v5;
  v6 = *(_OWORD *)&self->super.sendTapEventForAnyTapInsideView[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute];
  v10[2] = *(_OWORD *)&self->super.requesterIdentifier[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute];
  v10[3] = v6;
  v7 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute];
  v10[4] = *(_OWORD *)&self->super.idleTimer[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                           + 6];
  v10[5] = v7;
  v8 = *(_OWORD *)&self->super.delegate[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                      + 8];
  v10[0] = *(_OWORD *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute);
  v10[1] = v8;
  sub_100006E80(v10);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_endpointController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_controller));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_airPlayImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_trailingAccessoryView));
  v9 = *(_QWORD *)&self->super.delegate[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_state];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.delegate[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_state
                                                           + 8]);
  swift_bridgeObjectRelease(v9);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_elementIdentifier));
}

@end
