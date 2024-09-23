@implementation BuddyMultitaskingController

- (void)setDelegate:(id)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_delegate];
  *(_QWORD *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_delegate] = a3;
  swift_unknownObjectRetain(a3, a2);
  swift_unknownObjectRelease(v3);
}

- (_TtC5Setup27BuddyMultitaskingController)init
{
  return (_TtC5Setup27BuddyMultitaskingController *)sub_10000AE54();
}

- (void)viewDidLoad
{
  _TtC5Setup27BuddyMultitaskingController *v2;

  v2 = self;
  sub_10000B068();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5Setup27BuddyMultitaskingController *v4;

  v4 = self;
  sub_10000B818(a3);

}

- (void)continueTapped
{
  _TtC5Setup27BuddyMultitaskingController *v2;

  v2 = self;
  sub_10000B8E0();

}

- (void)useDefaultSettingsTapped
{
  _TtC5Setup27BuddyMultitaskingController *v2;

  v2 = self;
  sub_10000BCCC();

}

- (BYRunState)runState
{
  return (BYRunState *)(id)swift_unknownObjectRetain(*(_QWORD *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_runState], a2);
}

- (void)setRunState:(id)a3
{
  sub_10000C028((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_runState);
}

- (BYCapabilities)capabilities
{
  return (BYCapabilities *)(id)swift_unknownObjectRetain(*(_QWORD *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_capabilities], a2);
}

- (void)setCapabilities:(id)a3
{
  sub_10000C028((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_capabilities);
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return (BYPaneFeatureAnalyticsManager *)*(id *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_paneFeatureAnalyticsManager];
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_paneFeatureAnalyticsManager];
  *(_QWORD *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_paneFeatureAnalyticsManager] = a3;
  v3 = a3;

}

- (BYAnalyticsManager)analyticsManager
{
  return (BYAnalyticsManager *)*(id *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_analyticsManager];
}

- (void)setAnalyticsManager:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_analyticsManager];
  *(_QWORD *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_analyticsManager] = a3;
  v3 = a3;

}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 8;
}

- (BOOL)controllerNeedsToRun
{
  _TtC5Setup27BuddyMultitaskingController *v2;
  uint64_t v3;
  char v4;

  v2 = self;
  v4 = sub_10000C0F0((uint64_t)v2, v3);

  return v4 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC5Setup27BuddyMultitaskingController *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10027F248, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_10000C1F4((uint64_t)sub_10000C900, v5);

  swift_release(v5);
}

- (_TtC5Setup27BuddyMultitaskingController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC5Setup27BuddyMultitaskingController *result;

  result = (_TtC5Setup27BuddyMultitaskingController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddyMultitaskingController", 33, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC5Setup27BuddyMultitaskingController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC5Setup27BuddyMultitaskingController *result;

  v6 = a5;
  result = (_TtC5Setup27BuddyMultitaskingController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddyMultitaskingController", 33, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->name[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_name]);

  swift_unknownObjectRelease(*(_QWORD *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_delegate]);
  swift_unknownObjectRelease(*(_QWORD *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_runState]);
  swift_unknownObjectRelease(*(_QWORD *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_capabilities]);

}

@end
