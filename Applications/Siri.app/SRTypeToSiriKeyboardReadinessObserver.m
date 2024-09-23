@implementation SRTypeToSiriKeyboardReadinessObserver

- (SRTypeToSiriKeyboardReadinessObserver)initWithDelegate:(id)a3
{
  SRTypeToSiriKeyboardReadinessObserver *v4;

  swift_unknownObjectRetain(a3);
  v4 = (SRTypeToSiriKeyboardReadinessObserver *)sub_1000768F8((uint64_t)a3);
  swift_unknownObjectRelease(a3);
  return v4;
}

- (void)dealloc
{
  SRTypeToSiriKeyboardReadinessObserver *v2;

  v2 = self;
  sub_100076268();
}

- (void).cxx_destruct
{

  sub_1000769B8((uint64_t)self + OBJC_IVAR___SRTypeToSiriKeyboardReadinessObserver_delegate);
}

- (void)start
{
  SRTypeToSiriKeyboardReadinessObserver *v2;

  v2 = self;
  sub_1000763A8();

}

- (void)stop
{
  SRTypeToSiriKeyboardReadinessObserver *v2;

  v2 = self;
  sub_1000765CC();

}

- (void)keyboardCanRespondToUserInputWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  SRTypeToSiriKeyboardReadinessObserver *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1000766C4();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (SRTypeToSiriKeyboardReadinessObserver)init
{
  SRTypeToSiriKeyboardReadinessObserver *result;

  result = (SRTypeToSiriKeyboardReadinessObserver *)_swift_stdlib_reportUnimplementedInitializer("Siri.TypeToSiriKeyboardReadinessObserver", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
