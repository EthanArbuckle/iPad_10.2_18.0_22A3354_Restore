@implementation HealthAppBuddyCompleteInputSignal.Observer

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  _TtCC14HealthPlatform33HealthAppBuddyCompleteInputSignal8Observer *v10;
  id v11;
  _TtCC14HealthPlatform33HealthAppBuddyCompleteInputSignal8Observer *v12;
  _OWORD v13[2];

  if (a3)
  {
    sub_1BC817AE8();
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v13, 0, sizeof(v13));
    v11 = a5;
    v12 = self;
    if (!a5)
      goto LABEL_7;
    goto LABEL_4;
  }
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v9 = a5;
  v10 = self;
  sub_1BC818178();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_1BC6E1788(&qword_1EF45AED0, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_1BC819EE8);
    sub_1BC817A34();

  }
LABEL_7:
  sub_1BC810E7C();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BC6EF7BC((uint64_t)v13);
}

- (_TtCC14HealthPlatform33HealthAppBuddyCompleteInputSignal8Observer)init
{
  _TtCC14HealthPlatform33HealthAppBuddyCompleteInputSignal8Observer *result;

  result = (_TtCC14HealthPlatform33HealthAppBuddyCompleteInputSignal8Observer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
