@implementation SRCarPlayPresentation

- (SiriUIPresentationDelegate)delegate
{
  return (SiriUIPresentationDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___SRCarPlayPresentation_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___SRCarPlayPresentation_delegate, a3);
}

- (SiriUIPresentationDataSource)dataSource
{
  return (SiriUIPresentationDataSource *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___SRCarPlayPresentation_dataSource, a2);
}

- (void)setDataSource:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___SRCarPlayPresentation_dataSource, a3);
}

- (SRCarPlayPresentation)initWithDelegate:(id)a3 dataSource:(id)a4
{
  uint64_t v6;

  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  return (SRCarPlayPresentation *)sub_10007A778((uint64_t)a3, (uint64_t)a4, v6);
}

- (SRCarPlayPresentation)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5 dataSource:(id)a6
{
  uint64_t v10;
  _QWORD *v11;
  id v12;
  SRCarPlayPresentation *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR___SRCarPlayPresentation_delegate, 0, a3);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR___SRCarPlayPresentation_dataSource, 0, v10);
  v11 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
  *v11 = 0;
  v11[1] = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___SRCarPlayPresentation_siriIsIdleAndQuiet) = 2;
  v12 = a4;
  swift_unknownObjectRetain(a5);
  swift_unknownObjectRetain(a6);

  result = (SRCarPlayPresentation *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x6C706D6920746F4ELL, 0xEF6465746E656D65, "Siri/SRCarPlayPresentation.swift", 32, 2, 53, 0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  void *v3;
  SRCarPlayPresentation *v4;
  objc_super v5;

  v3 = (void *)objc_opt_self(NSObject);
  v4 = self;
  objc_msgSend(v3, "cancelPreviousPerformRequestsWithTarget:", v4);
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for SRCarPlayPresentation();
  -[SRCarPlayPresentation dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  sub_1000769B8((uint64_t)self + OBJC_IVAR___SRCarPlayPresentation_delegate);
  sub_1000769B8((uint64_t)self + OBJC_IVAR___SRCarPlayPresentation_dataSource);

}

- (void)autodismiss
{
  SRCarPlayPresentation *v2;

  v2 = self;
  sub_10007AB84();

}

- (SRCarPlayPresentation)init
{
  SRCarPlayPresentation *result;

  result = (SRCarPlayPresentation *)_swift_stdlib_reportUnimplementedInitializer("Siri.SRCarPlayPresentation", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)conversation:(id)a3 didChangeWithTransaction:(id)a4
{
  id v7;
  id v8;
  SRCarPlayPresentation *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_10007BEB0(a3, a4);

}

- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3
{
  id v5;
  SRCarPlayPresentation *v6;

  v5 = a3;
  v6 = self;
  sub_10007C508((uint64_t)a3);

  return 1;
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  return 0;
}

- (int64_t)options
{
  return 2;
}

- (BOOL)shouldProceedToNextCommandAtSpeechSynthesisEnd
{
  SRCarPlayPresentation *v2;
  char v3;
  char v4;

  v2 = self;
  sub_10007C650();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)shouldAllowTouchPassThrough
{
  return 0;
}

- (BOOL)shouldUseEventDrivenIdleAndQuietUpdates
{
  return 1;
}

- (void)siriIsIdleAndQuietStatusDidChange:(BOOL)a3 isAttending:(BOOL)a4
{
  SRCarPlayPresentation *v6;

  v6 = self;
  sub_10007C72C(a3, a4);

}

- (void)handleRequestEndBehavior:(id)a3 isAttending:(BOOL)a4
{
  id v6;
  SRCarPlayPresentation *v7;

  v6 = a3;
  v7 = self;
  sub_10007CC9C(v6, a4);

}

- (BOOL)shouldResumeInterruptedAudioPlaybackForAttendingState:(BOOL)a3
{
  if (a3)
    return *((_BYTE *)&self->super.isa + OBJC_IVAR___SRCarPlayPresentation_shouldResumeMediaOnIdle);
  else
    return 1;
}

- (BOOL)shouldResumeInterruptedAudioPlayback
{
  return 1;
}

- (void)siriDidDeactivateWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  SRCarPlayPresentation *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_100124858, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_10007F3E4;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_10007CFB8((void (*)(void))v7);
  sub_10007F3B0((uint64_t)v7, v6);

}

- (void)siriWillBePresented:(int64_t)a3
{
  SRCarPlayPresentation *v4;

  v4 = self;
  sub_10007D0FC(a3);

}

- (void)siriDidStartSpeakingWithIdentifier:(id)a3
{
  sub_10007D674(self, (uint64_t)a2, (uint64_t)a3, sub_10007D240);
}

- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  SRCarPlayPresentation *v10;
  id v11;

  if (a3)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
  if (v9)
  {
    v10 = self;
    v11 = v9;
    sub_10008C310(v6, v8, a4);

    swift_bridgeObjectRelease(v8);
  }
  else
  {
    __break(1u);
  }
}

- (void)siriRequestWillStartWithRequestOptions:(id)a3
{
  id v5;
  SRCarPlayPresentation *v6;

  v5 = a3;
  v6 = self;
  sub_10007D3BC(a3);

}

- (void)siriDidUpdateASRWithRecognition:(id)a3
{
  sub_10007D674(self, (uint64_t)a2, (uint64_t)a3, sub_10007D590);
}

- (void)siriDidOpenURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  SRCarPlayPresentation *v14;
  uint64_t v15;

  v8 = sub_100076100(&qword_10014F878);
  __chkstk_darwin(v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v11 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    v12 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v13;
  }
  v14 = self;
  sub_10007F19C((uint64_t)v10);

  swift_bridgeObjectRelease(a4);
  sub_10007F328((uint64_t)v10);
}

- (void)siriDidTransitionFromState:(int64_t)a3 event:(int64_t)a4
{
  SRCarPlayPresentation *v6;

  v6 = self;
  sub_10007D7C8(a3, a4);

}

- (id)viewController
{
  id result;

  result = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
  if (result)
    return result;
  __break(1u);
  return result;
}

- (void)handleRequestToCeaseAttending
{
  uint64_t v2;
  SRCarPlayPresentation *v3;

  v3 = self;
  sub_10007E044((uint64_t)v3, v2);

}

- (void)configureForRequestOptions:(id)a3
{
  id v4;
  SRCarPlayPresentation *v5;

  v4 = a3;
  v5 = self;
  sub_10007E400(v4);

}

@end
