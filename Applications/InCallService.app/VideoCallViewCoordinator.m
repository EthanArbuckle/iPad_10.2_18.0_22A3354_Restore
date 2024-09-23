@implementation VideoCallViewCoordinator

- (void)dealloc
{
  _TtC13InCallServiceP33_54F15DC26ECDE4E093E20EA054ADA2B524VideoCallViewCoordinator *v2;

  v2 = self;
  sub_10011C624();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13InCallServiceP33_54F15DC26ECDE4E093E20EA054ADA2B524VideoCallViewCoordinator_configuration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InCallServiceP33_54F15DC26ECDE4E093E20EA054ADA2B524VideoCallViewCoordinator_bannerPresentationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InCallServiceP33_54F15DC26ECDE4E093E20EA054ADA2B524VideoCallViewCoordinator_viewController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13InCallServiceP33_54F15DC26ECDE4E093E20EA054ADA2B524VideoCallViewCoordinator_orientationTask));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InCallServiceP33_54F15DC26ECDE4E093E20EA054ADA2B524VideoCallViewCoordinator_audioRouteGlyphForDevice));
}

- (void)viewControllerDidRequestAddParticipants:(id)a3
{
  FactoryOutcome.rawValue.getter(a3, a2);
}

- (void)viewController:(id)a3 setStatusBarHidden:(BOOL)a4
{
  FactoryOutcome.rawValue.getter(a3, a4);
}

- (void)viewControllerDidRequestTemporaryPreventSuspension:(id)a3
{
  FactoryOutcome.rawValue.getter(a3, a2);
}

- (void)viewController:(id)a3 fullScreenFocusedParticipantOrientationChanged:(int64_t)a4
{
  FactoryOutcome.rawValue.getter(a3, a4);
}

- (void)viewController:(id)a3 fullScreenFocusedParticipantAspectRatioChanged:(CGSize)a4 participantGridIsFullScreen:(BOOL)a5
{
  FactoryOutcome.rawValue.getter(a3, a5);
}

- (id)audioRouteMenu
{
  return (id)_s13InCallService15ScoreControllerC8delegateAA0dE8Delegate_pSgvpfi_0();
}

- (id)audioRouteGlyphFor:(id)a3 buttonStyle:(int64_t)a4
{
  return (id)_s13InCallService15ScoreControllerC8delegateAA0dE8Delegate_pSgvpfi_0();
}

- (UIImage)audioRouteGlyphForDevice
{
  return (UIImage *)sub_10011CA7C();
}

- (void)setAudioRouteGlyphForDevice:(id)a3
{
  id v5;
  _TtC13InCallServiceP33_54F15DC26ECDE4E093E20EA054ADA2B524VideoCallViewCoordinator *v6;

  v5 = a3;
  v6 = self;
  sub_10011CAF0((uint64_t)a3);

}

- (id)bottomControlsViewForViewController:(id)a3
{
  return (id)_s13InCallService15ScoreControllerC8delegateAA0dE8Delegate_pSgvpfi_0();
}

- (void)updateBackgroundStartPipAuthorizationState
{
  FactoryOutcome.rawValue.getter(self, a2);
}

- (BOOL)isMultiwayViewControllerShowingInMiniWindow
{
  return UniqueAddress.init()()._placeholder & 1;
}

- (BOOL)isShownAboveCoverSheet
{
  return UniqueAddress.init()()._placeholder & 1;
}

- (BOOL)wantsStandardControls
{
  return UniqueAddress.init()()._placeholder & 1;
}

- (void)unansweredCallUIDismissed
{
  FactoryOutcome.rawValue.getter(self, a2);
}

- (BOOL)hasPresentedFullScreenCallUI
{
  return sub_10011CBF8() & 1;
}

- (void)setHasPresentedFullScreenCallUI:(BOOL)a3
{
  sub_10011CC2C(a3);
}

- (BOOL)isPresentingFullScreenCallUI
{
  return sub_10011CC60() & 1;
}

- (void)setIsPresentingFullScreenCallUI:(BOOL)a3
{
  sub_10011CC94(a3);
}

- (BOOL)isAmbient
{
  return sub_10011CCC8() & 1;
}

- (void)setIsAmbient:(BOOL)a3
{
  sub_10011CCFC(a3);
}

- (void)bannerPresentationManagerRequestToPresentBanner:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject(&unk_1002892B0, 24, 7);
  *(_QWORD *)(v4 + 16) = v3;
  FactoryOutcome.rawValue.getter(sub_10011ACA8, v4);
  swift_release(v4);
}

- (void)bannerPresentationManagerUpdatedControlsManagerCallUUID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = sub_1001085C0(&qword_1002D7D78);
  __chkstk_darwin(v4, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for UUID(0);
    v9 = 0;
  }
  else
  {
    v8 = type metadata accessor for UUID(0);
    v9 = 1;
  }
  sub_100108600((uint64_t)v7, v9, 1, v8);
  FactoryOutcome.rawValue.getter(v7, v10);
  sub_10011ABE4((uint64_t)v7, &qword_1002D7D78);
}

- (void)bannerPresentationManagerBannerPresentationManagerAVUpgradedCallUUID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  FactoryOutcome.rawValue.getter(v7, v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)bannerPresentationManagerShowFullscreenUI
{
  FactoryOutcome.rawValue.getter(self, a2);
}

- (NSString)inCallSceneSessionIdentifier
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  sub_10011CF1C();
  if (v2)
  {
    v3 = v2;
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSSet)backgroundActivitiesToSuppress
{
  void *v2;
  Class isa;

  v2 = variable initialization expression of AudioControlService.cancellables();
  type metadata accessor for STBackgroundActivityIdentifier(0);
  sub_1001081CC(&qword_1002D79E0, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_1002410A4);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSSet *)isa;
}

- (BOOL)isAlertAvailable
{
  return UniqueAddress.init()()._placeholder & 1;
}

- (_TtC13InCallServiceP33_54F15DC26ECDE4E093E20EA054ADA2B524VideoCallViewCoordinator)init
{
  sub_10011CFB8();
}

@end
