@implementation CNTipsHelper

- (_TtC10ContactsUI12CNTipsHelper)init
{
  return (_TtC10ContactsUI12CNTipsHelper *)CNTipsHelper.init()();
}

+ (_TtC10ContactsUI12CNTipsHelper)shared
{
  if (qword_1EDF97A48 != -1)
    swift_once();
  return (_TtC10ContactsUI12CNTipsHelper *)(id)qword_1EDF98000;
}

- (void)tipKitSetSiriTipContext:(id)a3
{
  uint64_t v3;

  qword_1EDF97A30 = sub_18AF4FC5C();
  qword_1EDF97A38 = v3;
  swift_bridgeObjectRelease();
}

- (void)tipKitStartObservation:(id)a3
{
  _TtC10ContactsUI12CNTipsHelper *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_18ACB1904();

  swift_unknownObjectRelease();
}

- (UIView)currentTipView
{
  return (UIView *)sub_18ACB1AEC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_currentTipView);
}

- (void)setCurrentTipView:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_currentTipView);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)tipKitStopObservation
{
  _TtC10ContactsUI12CNTipsHelper *v2;

  v2 = self;
  sub_18AD6C0E0();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

@end
