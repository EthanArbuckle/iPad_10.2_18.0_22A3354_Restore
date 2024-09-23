@implementation SRSiriSystemUIController

- (SRSiriSystemUIController)initWithDelegate:(id)a3 systemUIDevice:(BOOL)a4 systemApertureSupportedDevice:(BOOL)a5
{
  _BOOL8 v5;
  SRSiriSystemUIController *v8;

  v5 = a5;
  swift_unknownObjectRetain(a3);
  v8 = (SRSiriSystemUIController *)sub_100082570((uint64_t)a3, a4, v5);
  swift_unknownObjectRelease(a3);
  return v8;
}

- (void)updateSystemUIForAddViews:(id)a3 viewMode:(int64_t)a4 lockState:(unint64_t)a5 isInAmbient:(BOOL)a6
{
  id v10;
  SRSiriSystemUIController *v11;

  v10 = a3;
  v11 = self;
  sub_10007FB14(v10, a4, a5, a6);

}

- (id)transformAddViews:(id)a3 mode:(unint64_t)a4 idiom:(int64_t)a5
{
  id v8;
  SRSiriSystemUIController *v9;
  _BYTE *v10;

  v8 = a3;
  v9 = self;
  v10 = sub_100080460(v8, a4, a5);

  return v10;
}

- (BOOL)shouldRedactSnippetForAddViews:(id)a3
{
  return sub_100083104();
}

- (void)tearDown
{
  SRSiriSystemUIController *v2;

  v2 = self;
  sub_1000814F8();

}

- (void)tapToEditPresented
{
  char *v1;

  if (a1[OBJC_IVAR___SRSiriSystemUIController_systemUIDevice] == 1
    && *(_QWORD *)&a1[OBJC_IVAR___SRSiriSystemUIController_viewMode] == 7)
  {
    v1 = a1;
    sub_1000816F8();

  }
}

- (void)orientationChangedTo:(int64_t)a3
{
  _BOOL4 v4;
  SRSiriSystemUIController *v5;
  SRSiriSystemUIController *v6;

  v4 = sub_1000830F4(a3);
  v5 = self;
  if (v4
    && (*((_BYTE *)&v5->super.isa + OBJC_IVAR___SRSiriSystemUIController_currentActivitySupportsLandscape) & 1) == 0)
  {
    v6 = v5;
    sub_1000816F8();
    v5 = v6;
  }

}

- (BOOL)presentingSystemUI
{
  return sub_100081680();
}

- (void)collapseSystemUI
{
  SRSiriSystemUIController *v2;

  v2 = self;
  sub_1000816F8();

}

- (SRSiriSystemUIController)init
{
  SRSiriSystemUIController *result;

  result = (SRSiriSystemUIController *)_swift_stdlib_reportUnimplementedInitializer("Siri.SiriSystemUIController", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000769B8((uint64_t)self + OBJC_IVAR___SRSiriSystemUIController_delegate);
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR___SRSiriSystemUIController_activityId]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR___SRSiriSystemUIController_domainResponseId]);

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___SRSiriSystemUIController_sessionListener));
}

@end
