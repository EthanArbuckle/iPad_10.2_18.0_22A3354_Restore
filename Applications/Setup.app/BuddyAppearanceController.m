@implementation BuddyAppearanceController

- (_TtC5Setup25BuddyAppearanceController)init
{
  return (_TtC5Setup25BuddyAppearanceController *)sub_100024A08();
}

- (void)viewDidLoad
{
  _TtC5Setup25BuddyAppearanceController *v2;

  v2 = self;
  sub_100024F30();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Setup25BuddyAppearanceController *v4;

  v4 = self;
  sub_1000260C8(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC5Setup25BuddyAppearanceController *v4;

  v4 = self;
  sub_10002688C(a3);

}

- (void)modeChanged
{
  _TtC5Setup25BuddyAppearanceController *v2;

  v2 = self;
  sub_100027174();

}

- (void)updateContentViewForScrollViewLayoutChange
{
  _TtC5Setup25BuddyAppearanceController *v2;

  v2 = self;
  sub_100027588();

}

- (BOOL)scrollViewContentIsUnderTray
{
  void *v3;
  _TtC5Setup25BuddyAppearanceController *v4;
  BOOL v5;
  _TtC5Setup25BuddyAppearanceController *v6;
  objc_super v8;

  v3 = *(void **)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_revertButton];
  if (!v3)
  {
    v6 = self;
    goto LABEL_5;
  }
  v4 = self;
  if ((objc_msgSend(v3, "isHidden") & 1) == 0)
  {
LABEL_5:
    v8.receiver = self;
    v8.super_class = (Class)type metadata accessor for BuddyAppearanceController();
    v5 = -[BuddyAppearanceController scrollViewContentIsUnderTray](&v8, "scrollViewContentIsUnderTray");

    return v5;
  }

  return 0;
}

- (void)continueTapped
{
  _TtC5Setup25BuddyAppearanceController *v2;

  v2 = self;
  sub_1000277BC();

}

- (void)revertTapped
{
  void *v2;
  uint64_t v3;
  id v4;
  char v5;
  char v6;
  _TtC5Setup25BuddyAppearanceController *v7;

  v2 = *(void **)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_slider];
  if (v2)
  {
    v3 = qword_1002E9CF0;
    v7 = self;
    v4 = v2;
    if (v3 != -1)
      swift_once(&qword_1002E9CF0, sub_100009368);
    sub_100028A00((id)qword_1002EED18, byte_1002EED20, (void *)qword_1002EED28, byte_1002EED30);
    v6 = v5;
    sub_100028760(v4);
    if ((v6 & 1) != 0)
      sub_1000269D0();

  }
}

- (void)showAccessibilitySettings
{
  void *v3;
  _TtC5Setup25BuddyAppearanceController *v4;
  _TtC5Setup25BuddyAppearanceController *v5;
  _TtC5Setup25BuddyAppearanceController *v6;
  _TtC5Setup25BuddyAppearanceController *v7;

  v3 = (void *)objc_opt_self(BuddyAccessibilityUtilities);
  v7 = self;
  v4 = (_TtC5Setup25BuddyAppearanceController *)objc_msgSend(v3, "accessibilityViewController");
  if (v4)
  {
    v5 = v4;
    -[BuddyAppearanceController presentViewController:animated:completion:](v7, "presentViewController:animated:completion:", v4, 1, 0);

    v6 = v5;
  }
  else
  {
    v6 = v7;
  }

}

- (BYRunState)runState
{
  return (BYRunState *)(id)swift_unknownObjectRetain(*(_QWORD *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_runState], a2);
}

- (void)setRunState:(id)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_runState];
  *(_QWORD *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_runState] = a3;
  swift_unknownObjectRetain(a3, a2);
  swift_unknownObjectRelease(v3);
}

- (_TtC5Setup22AppearanceModeProvider)appearanceModeProvider
{
  return (_TtC5Setup22AppearanceModeProvider *)*(id *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_appearanceModeProvider];
}

- (void)setAppearanceModeProvider:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_appearanceModeProvider];
  *(_QWORD *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_appearanceModeProvider] = a3;
  v3 = a3;

}

- (BuddyDisplayZoomExecutor)displayZoomExecutor
{
  return (BuddyDisplayZoomExecutor *)*(id *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_displayZoomExecutor];
}

- (void)setDisplayZoomExecutor:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_displayZoomExecutor];
  *(_QWORD *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_displayZoomExecutor] = a3;
  v3 = a3;

}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return (BuddyFlowItemDispositionProvider *)*(id *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_flowItemDispositionProvider];
}

- (void)setFlowItemDispositionProvider:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_flowItemDispositionProvider];
  *(_QWORD *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_flowItemDispositionProvider] = a3;
  v3 = a3;

}

- (BYAnalyticsEventAppearance)analyticsEventAppearance
{
  return (BYAnalyticsEventAppearance *)*(id *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_analyticsEventAppearance];
}

- (void)setAnalyticsEventAppearance:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_analyticsEventAppearance];
  *(_QWORD *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_analyticsEventAppearance] = a3;
  v3 = a3;

}

+ (id)cloudConfigSkipKey
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)(kMCCCSkipSetupAccessibilityAppearance);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

+ (unint64_t)applicableDispositions
{
  return 18;
}

- (BOOL)controllerNeedsToRun
{
  void *v2;

  v2 = *(void **)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_runState];
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "hasCompletedInitialRun") ^ 1;
  return (char)v2;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  void *v4;
  _TtC5Setup25BuddyAppearanceController *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1000295FC((char *)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)dealloc
{
  _TtC5Setup25BuddyAppearanceController *v2;

  v2 = self;
  sub_1000284EC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_supportedModes]);

  swift_unknownObjectRelease(*(_QWORD *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_delegate]);
  sub_10000E230((uint64_t)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_presentationDismissalObserver]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_sliderLocationConstraints]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_animationViewConstraints]);
  swift_unknownObjectRelease(*(_QWORD *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_runState]);

}

- (void)setDelegate:(id)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_delegate];
  *(_QWORD *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_delegate] = a3;
  swift_unknownObjectRetain(a3, a2);
  swift_unknownObjectRelease(v3);
}

+ (BOOL)controllerAffectedByTapFreeSetup
{
  return 1;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (_TtC5Setup25BuddyAppearanceController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC5Setup25BuddyAppearanceController *result;

  result = (_TtC5Setup25BuddyAppearanceController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddyAppearanceController", 31, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC5Setup25BuddyAppearanceController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC5Setup25BuddyAppearanceController *result;

  v6 = a5;
  result = (_TtC5Setup25BuddyAppearanceController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddyAppearanceController", 31, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

@end
