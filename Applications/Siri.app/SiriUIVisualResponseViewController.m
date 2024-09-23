@implementation SiriUIVisualResponseViewController

- (BOOL)isInAmbient
{
  return sub_10008FD3C(self, (uint64_t)a2, (SEL *)&selRef_isInAmbient);
}

- (void)setIsInAmbient:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  v4 = (char *)v6.receiver;
  -[SiriUIVisualResponseViewController setIsInAmbient:](&v6, "setIsInAmbient:", v3);
  v5 = SiriSharedUICompactAmbientContentScaleAmount;
  if (!v3)
    v5 = 1.0;
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView], "setIsInAmbient:withScaleFactor:", v3, v5, v6.receiver, v6.super_class);

}

- (BOOL)isInAmbientInteractivity
{
  return sub_10008FD3C(self, (uint64_t)a2, (SEL *)&selRef_isInAmbientInteractivity);
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  double *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  v4 = (char *)v6.receiver;
  -[SiriUIVisualResponseViewController setIsInAmbientInteractivity:](&v6, "setIsInAmbientInteractivity:", v3);
  v5 = (double *)&SiriSharedUICompactAmbientContentScaleAmount;
  if (v3)
    v5 = (double *)&SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView], "setIsInAmbient:withScaleFactor:", 1, *v5, v6.receiver, v6.super_class);

}

- (BOOL)isPresentedWithSmartDialogText
{
  return sub_10008FD3C(self, (uint64_t)a2, (SEL *)&selRef_isPresentedWithSmartDialogText);
}

- (void)setIsPresentedWithSmartDialogText:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  v4 = (char *)v5.receiver;
  -[SiriUIVisualResponseViewController setIsPresentedWithSmartDialogText:](&v5, "setIsPresentedWithSmartDialogText:", v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView], "setIsPresentedWithSmartDialogText:", v3, v5.receiver, v5.super_class);

}

- (NSString)appBundleId
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->visualResponseView[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_appBundleId];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->visualResponseView[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_appBundleId]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setAppBundleId:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)&self->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_appBundleId];
  v7 = *(_QWORD *)&self->visualResponseView[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_appBundleId];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (_TtC4Siri34SiriUIVisualResponseViewController)initWithView:(id)a3 aceObject:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (_TtC4Siri34SiriUIVisualResponseViewController *)sub_10008FE94(v5, a4);
}

- (_TtC4Siri34SiriUIVisualResponseViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  _TtC4Siri34SiriUIVisualResponseViewController *result;

  v5 = OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_snippetCommandExecutor;
  v6 = type metadata accessor for SnippetCommandExecutor(0, a2);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  *(_QWORD *)&self->SiriUICardSnippetViewController_opaque[v5] = SnippetCommandExecutor.init()(a3);
  v7 = &self->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_appBundleId];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_backgroundView;
  *(_QWORD *)&self->SiriUICardSnippetViewController_opaque[v8] = objc_msgSend(objc_allocWithZone((Class)UIVisualEffectView), "initWithEffect:", 0);

  result = (_TtC4Siri34SiriUIVisualResponseViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000E1170, "Siri/SiriUIVisualResponseViewController.swift", 45, 2, 88, 0);
  __break(1u);
  return result;
}

- (void)updateSharedState:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  Class isa;
  _TtC4Siri34SiriUIVisualResponseViewController *v11;

  v5 = a3;
  v11 = self;
  v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;

  v9 = *(id *)&v11->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView];
  isa = Data._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v9, "updateSharedStateData:", isa);

  sub_10007F3F0(v6, v8);
}

- (void)updateBackgroundIfNeeded
{
  _TtC4Siri34SiriUIVisualResponseViewController *v2;

  v2 = self;
  sub_1000902EC();

}

- (void)siriDidUpdateASRWithRecognition:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _TtC4Siri34SiriUIVisualResponseViewController *v7;
  id v8;
  id v9;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    v6 = *(void **)&self->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView];
    v7 = self;
    v8 = v6;
    v9 = String._bridgeToObjectiveC()();
    objc_msgSend(v8, "setAsrText:", v9);

    swift_bridgeObjectRelease(v5);
  }
}

- (void)siriDidStartSpeakingWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _TtC4Siri34SiriUIVisualResponseViewController *v7;
  id v8;
  id v9;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    v6 = *(void **)&self->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView];
    v7 = self;
    v8 = v6;
    v9 = String._bridgeToObjectiveC()();
    objc_msgSend(v8, "setPlayerState:aceId:", 0, v9);

    swift_bridgeObjectRelease(v5);
  }
}

- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _TtC4Siri34SiriUIVisualResponseViewController *v8;
  id v9;
  id v10;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
    v7 = *(void **)&self->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView];
    v8 = self;
    v9 = v7;
    v10 = String._bridgeToObjectiveC()();
    objc_msgSend(v9, "setPlayerState:aceId:", 1, v10);

    swift_bridgeObjectRelease(v6);
  }
}

- (void)siriWillStartRequest
{
  objc_msgSend(*(id *)&self->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView], "postSiriEvent:", 1);
}

- (void)siriDidDeactivate
{
  uint64_t v3;
  void *v4;
  _TtC4Siri34SiriUIVisualResponseViewController *v5;

  v3 = OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView;
  v4 = *(void **)&self->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView];
  v5 = self;
  objc_msgSend(v4, "endEditing:", 1);
  objc_msgSend(*(id *)&self->SiriUICardSnippetViewController_opaque[v3], "postSiriEvent:", 3);

}

- (void)siriDidTapOutsideContent
{
  objc_msgSend(*(id *)&self->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView], "postSiriEvent:", 4);
}

- (void)siriIsIdleAndQuiet
{
  objc_msgSend(*(id *)&self->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView], "postSiriEvent:", 5);
}

- (_TtC4Siri34SiriUIVisualResponseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC4Siri34SiriUIVisualResponseViewController *result;

  v4 = a4;
  result = (_TtC4Siri34SiriUIVisualResponseViewController *)_swift_stdlib_reportUnimplementedInitializer("Siri.SiriUIVisualResponseViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_snippetCommandExecutor]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->visualResponseView[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_appBundleId]);

}

- (void)performAceCommand:(id)a3
{
  id v5;
  _TtC4Siri34SiriUIVisualResponseViewController *v6;

  swift_getObjectType(a3);
  v5 = a3;
  v6 = self;
  sub_1000935E4(v5, v6);

}

- (void)performSFCommand:(id)a3
{
  id v4;
  _TtC4Siri34SiriUIVisualResponseViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000907B0((uint64_t)v4);

}

- (void)performShowResponse:(id)a3
{
  sub_1000917DC(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_100090C6C);
}

- (void)submitIFMessagePayload:(id)a3
{
  sub_1000917DC(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_100090F4C);
}

- (void)navigateWithResponseData:(id)a3
{
  sub_1000917DC(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))sub_1000915FC);
}

- (void)navigateWithPluginModelData:(id)a3 bundleName:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC4Siri34SiriUIVisualResponseViewController *v14;

  v7 = a3;
  v8 = a4;
  v14 = self;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;

  static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v13 = v12;

  sub_10009185C();
  swift_bridgeObjectRelease(v13);
  sub_10007F3F0(v9, v11);

}

- (void)navigateWithAceCommand:(id)a3
{
  id v4;
  _TtC4Siri34SiriUIVisualResponseViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100091A6C(v4);

}

- (void)informHostOfViewResize:(CGSize)a3
{
  double height;
  double width;
  _TtC4Siri34SiriUIVisualResponseViewController *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_100092458(width, height);

}

- (void)willBeginEditing
{
  _TtC4Siri34SiriUIVisualResponseViewController *v2;

  v2 = self;
  sub_100092608();

}

- (void)didEndEditing
{
  _TtC4Siri34SiriUIVisualResponseViewController *v2;

  v2 = self;
  sub_1000926CC();

}

@end
